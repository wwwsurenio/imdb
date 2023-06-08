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
    private let movie: MovieModel
    
    var delegate: MovieDetailsControllerDelegate?
    
    init(movie: MovieModel) {
        self.movie = movie
    }
}

extension MovieDetailsController: MovieDetailsControllerInput {
    func get() {
        let session = URLSession(configuration: .default)
    
        let task = session.dataTask(withAPI: MoviesAPI.details(movieID: movie.movieID)) { [weak self] (data, response, error) in
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
                
                // Print the parsed movie details data
                print("Movie Title: \(movieDetailsData.original_title)")
                print("Movie Overview: \(movieDetailsData.overview)")
                print("Movie Poster URL: \(movieDetailsData.poster_path)")
                print("Movie Release Date: \(movieDetailsData.release_date)")
                print("Movie Vote: \(movieDetailsData.vote_average)")
                print("Movie Vote Count: \(movieDetailsData.vote_count)")
                print("-----")
                
                // Use the parsed movieDetailsData
                DispatchQueue.main.async {
                    let movieDetailsModel = MovieDetailsModel(
                        movieTitle: movieDetailsData.original_title,
                        movieOverview: movieDetailsData.overview,
                        moviePosterURL: movieDetailsData.poster_path,
                        movieReleaseDate: movieDetailsData.release_date,
                        movieVote: movieDetailsData.vote_average,
                        movieVoteCount: movieDetailsData.vote_count
                    )
                    self.delegate?.receivedData(movieDetailsModel: movieDetailsModel)
                }
            } catch {
                print("Parsing JSON failed: \(error)")
            }
        }
        
        print("Start loading movie details for movie ID: \(movie.movieID)")
        task.resume()
    }
    
    func parseJSON(jsonData: Data) throws -> MovieDetailsData {
        let decoder = JSONDecoder()
        let movieDetailsData = try decoder.decode(MovieDetailsData.self, from: jsonData)
        return movieDetailsData
    }
}
