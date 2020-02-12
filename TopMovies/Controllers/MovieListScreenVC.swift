//
//  MovieListScreenVC.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

class MovieListScreenVC: UIViewController {
    
    // data for TableView
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets data from temporary array
        movies = createArray()
    }
    
    // function creates data for TableView and returns it into a temporary array
    func createArray() -> [Movie] {
        
        var tempMovies: [Movie] = []
        let movie1 = Movie(poster: #imageLiteral(resourceName: "avengersposter"), name: "Avengers: Infinity War", date: "April 25, 2018", rating: 83, description: "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy…")
        let movie2 = Movie(poster: #imageLiteral(resourceName: "venom"), name: "Venom", date: "September 28, 2018", rating: 66, description: "Investigative journalist Eddie Brock attempts a comeback following a scandal, but accidentally becomes the host of Venom, a violent, super powerful alien symbiote. Soon, he must rely on his newfound powers to protect…")
        
        tempMovies.append(movie1)
        tempMovies.append(movie2)
        return tempMovies
    }

    // TODO: FIX LABEL TEXT TRANSFERRING
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "toDatePicker") {
            let vc = segue.destination as! DatePickerVC
            vc.desiredMovieNameLabel = "hi"
        }
    }
    
    // MARK: - JSON parsing
    
}

// MARK: - UITableView
extension MovieListScreenVC: UITableViewDataSource, UITableViewDelegate {
    
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



