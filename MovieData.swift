//
//  MovieData.swift
//  TopMovies
//
//  Created by Анна Никифорова on 10.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import Foundation

struct MovieData: Decodable {
    var results: [MovieInfo]
}

struct MovieInfo: Decodable {
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let vote_average: Double
}
