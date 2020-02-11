//
//  MovieTableViewCell.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var sheduleViewingButton: UIButton!
    
    // cell configuration
    func setMovie(movie: Movie) {
       // MARK: FIX THE IMAGE THING, IT'S A STRING
        movieImageView.image = movie.poster
        movieNameLabel.text = movie.name
        releaseDateLabel.text = movie.date
        ratingLabel.text = String(Int(movie.rating /* * 10 */))
        descriptionTextView.text = movie.description
    }
    
}
