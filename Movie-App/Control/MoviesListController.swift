//
//  MoviesListViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import Foundation
import UIKit

class MoviesListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        super.viewDidLoad()
    }
    
    
}
