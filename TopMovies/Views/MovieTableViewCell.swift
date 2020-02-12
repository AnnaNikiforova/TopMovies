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
    func setMovie(movie: MovieInfo) {
        
        movieNameLabel.text = movie.title
        releaseDateLabel.text = movie.release_date
        ratingLabel.text = String(Int(movie.vote_average * 10))
        descriptionTextView.text = movie.overview
        
        // TODO: FIX THE IMAGE THING, IT'S A STRING!
        if let imageURL = URL(string: movie.poster_path) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }
        }
    }
    
    @IBAction func sheduleButtonTapped(_ sender: Any) {
        print("works")
    }
}
