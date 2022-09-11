//
//  MainViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: Movie = movies[indexPath.row]
        let cell = moviesTable.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! customTableCell
        
        cell.configureCell(info: movie)

        // TODO: figure out code flow
//        cell.saveToFav = {
//            cell.favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = moviesTable.cellForRow(at: indexPath) as! customTableCell

        let targetStoryboardName = "MovieDetails"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)

        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
            targetViewController.movie = cell.movie
        }
    }
    
    @IBOutlet weak var moviesTable: UITableView!

    override func viewDidLoad() {
        let checked: Bool = false
        
        super.viewDidLoad()
        
        if checked == false {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let targetStoryboardName = "Login"
                let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
                if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController {
                    self.present(targetViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    let movies: [Movie] = [
        Movie(name: "movie1", rating: "5.0", duration: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie2", rating: "4.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie3", rating: "3.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie4", rating: "2.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie5", rating: "1.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
    ]
}
struct Movie{
    let  name, rating, duration, category, year, director: String
    var isFavourite: Bool = false
    
}
