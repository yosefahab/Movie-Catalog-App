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
        let mov: movie = movies[indexPath.row]
        let cell = moviesTable.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! customTableCell
        cell.name.text = mov.name
        cell.rating.text = mov.rating
        cell.duration.text = mov.duration
        cell.category.text = mov.category
        cell.img.image = UIImage(systemName: "person")
        cell.layer.cornerRadius = 12
        return cell
    }
    
    @IBOutlet weak var moviesTable: UITableView!
 
    override func viewDidLoad() {
        let check: Bool = false
        //            self.navigationController?.pushViewController(targetViewController, animated: true)
        super.viewDidLoad()
        if check == false {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let targetStoryboardName = "Login"
                let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
                if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController {
                    self.present(targetViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    struct movie{
        let name, rating, duration, category: String
    }
    let movies: [movie] = [
        movie(name: "movie", rating: "movie", duration: "movie", category: "movie"),
        movie(name: "movie", rating: "movie", duration: "movie", category: "movie"),
        movie(name: "movie", rating: "movie", duration: "movie", category: "movie")
    ]

}
