//
//  MovieTableViewCell.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

protocol MovieCellDelegate {
    func didTapScheduleButton(title: String)
}

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var scheduleViewingButton: UIButton!
    
    var delegate: MovieCellDelegate?
    
    // cell configuration
    func setMovie(movie: MovieInfo) {
        
        movieNameLabel.text = movie.title
        ratingLabel.text = String(Int(movie.vote_average * 10))
        descriptionTextView.text = movie.overview
        
        // date formatting
        func formatDate(dateMovie: String) -> String {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
            
            if let date = dateFormatterGet.date(from: movie.release_date) {
                return dateFormatterPrint.string(from: date)
            } else {
                print("There was an error decoding the string")
            }
            return ""
        }
        releaseDateLabel.text = formatDate(dateMovie: movie.release_date)
        
        // image converting
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path) {
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
            self.delegate!.didTapScheduleButton(title: movieNameLabel.text!)
    }
}
