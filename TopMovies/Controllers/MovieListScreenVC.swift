//
//  MovieListScreenVC.swift
//  TopMovies
//
//  Created by Анна Никифорова on 06.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit


class MovieListScreenVC: UIViewController {
    
    var movies = [MovieInfo]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // TODO: FIX LABEL TEXT TRANSFERRING
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toDatePicker") {
            let vc = segue.destination as! ScheduleViewingVC
            vc.desiredMovieNameLabel = "hi"
        }
    }
    
    // MARK: - JSON parsing
    func getData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=4df29c189fd27f2129b274a60619e43c&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&primary_release_year=2019") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            print(data)
            
            do {
                let downloadedMovieData = try JSONDecoder().decode(MovieData.self, from: data)
                self.movies = downloadedMovieData.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        } .resume()
    }
    
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



