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
    func recievedData(movieDetailsModels: [MovieDetailsModel])
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
        MoviesAPI.details(movieID: 1)
    }
}
