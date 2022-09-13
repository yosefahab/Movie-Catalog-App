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
    
    // fill cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // filter by movies with rating >= 4.0
        if collectionView === topMoviesCollection {
            let cell = topMoviesCollection.dequeueReusableCell(withReuseIdentifier: "topMoviesCollectionCell", for: indexPath) as! CustomCollectionViewCell
            // TODO: dynamic images
            // movies[cell.id].img
            cell.img.image = UIImage(named: "pic")
            return cell
        }
        // filter by movies with rating < 4.0
        else {
            let cell = moviesCollection.dequeueReusableCell(withReuseIdentifier: "moviesCollectionCell", for: indexPath) as! CustomMoviesCollectionViewCell
            cell.img.image = UIImage(named: "pic")
            return cell
        }
    }
    
    // navigate to detail view of this movie
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView === topMoviesCollection {
            let cell = topMoviesCollection.cellForItem(at: indexPath) as! CustomCollectionViewCell
            cell.configureCell(id: indexPath.row)
            let targetStoryboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
                targetViewController.movie = movies[cell.id!]
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
        else {
            let cell = moviesCollection.cellForItem(at: indexPath) as! CustomMoviesCollectionViewCell
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
                targetViewController.isModalInPresentation = true
                self.present(targetViewController, animated: true, completion: nil)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    @IBAction func favouritesBtnPressed(_ sender: Any) {
        let targetStoryboard = UIStoryboard(name: "FavouriteMoviesList", bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "FavouriteMoviesList") as? FavouriteMoviesListController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
        
    }
    @IBAction func actorsBtnPressed(_ sender: Any) {
        let targetStoryboard = UIStoryboard(name: "ActorsList", bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "ActorsList") as? ActorsListViewController {
            // navigate with right to left animation
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = .push
            transition.subtype = .fromLeft
            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
    }
    
}
