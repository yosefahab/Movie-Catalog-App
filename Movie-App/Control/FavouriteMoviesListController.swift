//
//  MoviesListViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import Foundation
import UIKit

class FavouriteMoviesListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: Movie = movies[indexPath.row]
        let cell = moviesTable.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableCell
        cell.configureCell(info: movie)
        // TODO: figure out code flow
//        cell.saveToFav = {
//            cell.favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        }
        return cell
    }
    // navigate to detail view of this movie
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = moviesTable.cellForRow(at: indexPath) as! CustomTableCell

        let targetStoryboardName = "MovieDetails"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)

        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
            targetViewController.movie = cell.movie
        }
    }
    
    @IBOutlet weak var moviesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
