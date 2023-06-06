//
//  MovieController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import Foundation
import UIKit

protocol MovieControllerInput: AnyObject {
    func get()
    var delegate: MovieControllerDelegate? { get set }
}

protocol MovieControllerDelegate: AnyObject {
    func recievedData(movieModels: [MovieModel])
}


class MovieController {
    weak var delegate: MovieControllerDelegate?
}

// MARK: - MovieControllerInput
extension MovieController: MovieControllerInput {

    func get() {
        let session = URLSession(configuration: .default)
        
        //The closure has three inputs: data, response, and error.
        //These hold the information we get back from the server.
        let task = session.dataTask(withAPI: MoviesAPI.popularList) { [weak self] (data, response, error) in
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
                    self.delegate?.recievedData(movieModels: movieModels)
                }
            } catch {
                print("Parsing JSON failed: \(error)")
            }
        }
        
        print("Start loading data for list")
        task.resume()
        
    }
    
    func parseJSON(jsonData: Data) throws -> [MovieModel] {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: jsonData)
        
        let movieModels = response.results.compactMap { (result: MovieResult) -> MovieModel? in
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + result.poster_path) else {
                return nil // Skip this movie if there's an issue with the image data
            }
            return MovieModel(
                moviePosterURL: imageURL,
                movieTitle: result.original_title,
                movieDescription: result.overview,
                movieRating: result.vote_average,
                movieID: result.id
            )
        }
        return movieModels
    }
}
