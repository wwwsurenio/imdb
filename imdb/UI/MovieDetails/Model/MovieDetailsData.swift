//
//  MovieData.swift
//  imdb
//
//  Created by User01 on 18/5/23.
//

import Foundation

struct MovieDetailsData: Codable {
    let original_title: String
    let overview: String
    let poster_path: URL
    let release_date: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let original_language: String
}
