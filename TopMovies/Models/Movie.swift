//
//  Movie.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    var poster: UIImage
    var name: String
    var date: String
    var rating: Double
    var description: String
    
    init(poster: UIImage, name: String, date: String, rating: Double, description: String) {
        self.poster = poster
        self.name = name
        self.date = date
        self.rating = rating
        self.description = description
    }
    
}
