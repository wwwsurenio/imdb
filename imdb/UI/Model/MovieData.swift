//
//  MovieData.swift
//  imdb
//
//  Created by User01 on 18/5/23.
//

import Foundation

struct MovieData: Decodable {
    let poster_path: String
    let original_title: String
    let overview: String
    let vote_average: Double
}

struct MovieResults: Decodable {
    let results: [MovieData]
}
