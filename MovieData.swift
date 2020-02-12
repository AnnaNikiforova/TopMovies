//
//  MovieData.swift
//  TopMovies
//
//  Created by Анна Никифорова on 10.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.


import Foundation

class MovieData: Decodable {
    let results: [MovieInfo]
    
    init(results: [MovieInfo]) {
        self.results = results
    }
}

class MovieInfo: Decodable {
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let vote_average: Double
    
    init(title: String, overview: String, poster_path: String, release_date: String, vote_average: Double) {
        self.title = title
        self.overview = overview
        self.poster_path = poster_path
        self.release_date = release_date
        self.vote_average = vote_average
    }
}
