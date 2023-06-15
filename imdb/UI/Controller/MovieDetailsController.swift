//
//  MovieDetailsController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

protocol MovieDetailsControllerInput: AnyObject {
    func get()
    var delegate: MovieDetailsControllerDelegate? { get set }
}

protocol MovieDetailsControllerDelegate: AnyObject {
    func receivedData(movieDetailsModel: MovieDetailsModel)
}

class MovieDetailsController {
    let movieID: Int
    
    var delegate: MovieDetailsControllerDelegate?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
}

extension MovieDetailsController: MovieDetailsControllerInput {
    func get() {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(withAPI: MoviesAPI.details(movieID: movieID)) { [weak self] (data, response, error) in
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
                let movieDetailsData = try self.parseJSON(jsonData: data)
                
                // Use the parsed movieDetailsData and complete URL
                DispatchQueue.main.async {
                    let movie = Movie(
                        movieTitle: movieDetailsData.original_title,
                        movieOverview: movieDetailsData.overview,
                        moviePosterURL: movieDetailsData.poster_path,
                        movieReleaseDate: movieDetailsData.release_date,
                        movieVote: movieDetailsData.vote_average,
                        movieVoteCount: movieDetailsData.vote_count
                    )
                    
                    let movieDetailsModel = MovieDetailsModel(movies: [movie])
                    
                    self.delegate?.receivedData(movieDetailsModel: movieDetailsModel)
                }
            } catch {
                print("Parsing JSON failed: \(error)")
            }
        }
        
        print("Start loading movie details for movie ID: \(movieID)")
        task.resume()
    }
    
    func parseJSON(jsonData: Data) throws -> MovieDetailsData {
        let decoder = JSONDecoder()
        let movieDetailsData = try decoder.decode(MovieDetailsData.self, from: jsonData)
        return movieDetailsData
    }
}
