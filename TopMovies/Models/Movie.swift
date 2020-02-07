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
    
    var image: UIImage
    var name: String
    var date: String
    var rating: String
    var description: String
    
    init(image: UIImage, name: String, date: String, rating: String, description: String) {
        self.image = image
        self.name = name
        self.date = date
        self.rating = rating
        self.description = description
    }
    
}
