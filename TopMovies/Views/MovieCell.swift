//
//  MovieTableViewCell.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var scheduleViewingButton: UIButton!
    
    // cell configuration
    func setMovie(movie: MovieInfo) {
        
        movieNameLabel.text = movie.title
        releaseDateLabel.text = movie.release_date
        ratingLabel.text = String(Int(movie.vote_average * 10))
        descriptionTextView.text = movie.overview
        
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w185_and_h278_bestv2" + movie.poster_path) {
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
    
    @IBAction func scheduleButtonTapped(_ sender: Any) {
        print("works")
    }
}
