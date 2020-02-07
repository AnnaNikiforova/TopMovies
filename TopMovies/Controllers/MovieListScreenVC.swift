//
//  MovieListScreenVC.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

class MovieListScreenVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        //sets data
        movies = createArray()

       }
    
    // function creates data and returns it into a temporary array
    func createArray() -> [Movie] {
        
        var tempMovies: [Movie] = []
        let movie1 = Movie(image: #imageLiteral(resourceName: "avengersposter"), name: "Avengers: Infinity War ", date: "April 25, 2018", rating: "83%", description: "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy…")
        
        tempMovies.append(movie1)
        return tempMovies
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        
        // cell configuration
        cell.setMovie(movie: movie)
        cell.selectionStyle = .none
        
        return cell
    }
    
}
