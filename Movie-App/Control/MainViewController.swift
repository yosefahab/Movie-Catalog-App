//
//  MainViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === topMoviesCollection {
            let cell = topMoviesCollection.dequeueReusableCell(withReuseIdentifier: "topMoviesCollectionCell", for: indexPath) as! customCollectionViewCell
            // TODO: dynamic images
            // movies[cell.id].img
            cell.img.image = UIImage(named: "pic")
            cell.img.layer.cornerRadius = 12
            return cell
        }
        else {
            let cell = topMoviesCollection.dequeueReusableCell(withReuseIdentifier: "topMoviesCollectionCell", for: indexPath) as! customCollectionViewCell
            cell.img.image = UIImage(named: "pic")
            cell.img.layer.cornerRadius = 12
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView === topMoviesCollection {
            let cell = topMoviesCollection.cellForItem(at: indexPath) as! customCollectionViewCell
            cell.configureCell(id: indexPath.row)
            let targetStoryboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
                targetViewController.movie = movies[cell.id!]
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
        else {
            let cell = moviesCollection.cellForItem(at: indexPath) as! customCollectionViewCell
            cell.configureCell(id: indexPath.row)
            let targetStoryboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
                targetViewController.movie = movies[cell.id!]
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
    }
    
    @IBOutlet weak var topMoviesCollection: UICollectionView!
    @IBOutlet weak var moviesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let checked: Bool = false
        if checked == false {
            let targetStoryboardName = "Login"
            let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
            if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController {
                self.present(targetViewController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func favouritesBtnPressed(_ sender: Any) {
        let targetStoryboard = UIStoryboard(name: "MoviesList", bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "MoviesList") as? MoviesListController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
        
    }
    @IBAction func actorsBtnPressed(_ sender: Any) {
        let targetStoryboard = UIStoryboard(name: "ActorsList", bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "ActorsList") as? ActorsListViewController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
    }
    
}
