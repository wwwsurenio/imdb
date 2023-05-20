//
//  MovieData.swift
//  imdb
//
//  Created by User01 on 18/5/23.
//

import Foundation

struct Response: Codable {
    let page: Int
    let results: [MovieResult]
    let total_pages: Int
    let total_results: Int
}

struct MovieResult: Codable {
    let original_title: String
    let overview: String
    let poster_path: String
    let vote_average: Double
}

