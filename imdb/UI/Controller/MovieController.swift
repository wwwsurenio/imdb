//
//  MovieController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import Foundation
import UIKit

protocol MovieControllerInput {
    func get()
    func parseJSON(jsonData: Data) throws -> [MovieModel]
}

class MovieController: NSObject {
    
    //why making movieModels a static var does not work in our case?
    var movieModels: [MovieModel] = []
    let apiURL = "https://api.themoviedb.org/3/movie/popular"
    let apiKey = "b859aa49388105f4ed7ff53a89a40f66"
}

// MARK: - MovieControllerInput
extension MovieController: MovieControllerInput {
    
    func get() {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: apiURL) else {
            assertionFailure("Invalid API URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.url?.append(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey)
        ])
        
        //The closure has three inputs: data, response, and error.
        //These hold the information we get back from the server.
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let movieModels = try self.parseJSON(jsonData: data)
                
                // Print the parsed movie data
                for item in movieModels {
                    print("Movie Title: \(item.movieTitle)")
                    print("Movie Description: \(item.movieDescription)")
                    print("Movie Rating: \(item.movieRating)")
                    print("-----")
                }
                
                // Use the parsed movieModels array
                DispatchQueue.main.async {
                    // Update UI or perform any other actions with the movieModels
                }
            } catch {
                print("Parsing JSON failed: \(error)")
            }
        }
        
        task.resume()
        
    }
    
    func parseJSON(jsonData: Data) throws -> [MovieModel] {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: jsonData)
        
        movieModels = response.results.compactMap { (result: MovieResult) -> MovieModel? in
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + result.poster_path),
                  let imageData = try? Data(contentsOf: imageURL),
                  let moviePoster = UIImage(data: imageData) else {
                return nil // Skip this movie if there's an issue with the image data
            }
            return MovieModel(
                moviePoster: moviePoster,
                movieTitle: result.original_title,
                movieDescription: result.overview,
                movieRating: result.vote_average
            )
        }
        return movieModels
    }
}

extension MovieController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let decodedData = String(decoding: data, as: UTF8.self)
        debugPrint(decodedData)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        debugPrint(error)
    }
}
