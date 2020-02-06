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
    
    func setMovie(movie: Movie) {
        movieImageView.image = movie.image
        movieNameLabel.text = movie.name
        releaseDateLabel.text = movie.date
        ratingLabel.text = movie.rating
        descriptionTextView.text = movie.description
    }
}
