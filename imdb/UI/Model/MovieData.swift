//
//  MovieData.swift
//  imdb
//
//  Created by User01 on 18/5/23.
//

import Foundation

struct Response: Codable {
    let results: [MovieResult]
}

struct MovieResult: Codable {
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String
    let vote_average: Double
}

