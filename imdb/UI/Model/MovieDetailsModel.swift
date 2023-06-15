//
//  MovieDetailsModel.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation

struct MovieDetailsModel {
    let movies: [Movie]
}

struct Movie {
    let movieTitle: String
    let movieOverview: String
    let moviePosterURL: URL
    let movieReleaseDate: String
    let movieVote: Double
    let movieVoteCount: Int
}
