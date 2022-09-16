//
//  MainViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === topMoviesCollection { return topMovies.count }
        else { return otherMovies.count }
        
    }

    // fill cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // filter by movies with rating >= 4.0
        if collectionView === topMoviesCollection {
            let cell = topMoviesCollection.dequeueReusableCell(withReuseIdentifier: "topMoviesCollectionCell", for: indexPath) as! CustomCollectionViewCell
            cell.configureCell(id: indexPath.row)
            return cell
        }
        
        // filter by movies with rating < 4.0
        else {
            let cell = moviesCollection.dequeueReusableCell(withReuseIdentifier: "moviesCollectionCell", for: indexPath) as! CustomMoviesCollectionViewCell
            
            cell.configureCell(id: indexPath.row)
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
                targetViewController.movie = cell.movie
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
        else {
            let cell = moviesCollection.cellForItem(at: indexPath) as! CustomMoviesCollectionViewCell
            cell.configureCell(id: indexPath.row)
            let targetStoryboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
                targetViewController.movie = cell.movie
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
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
        NotificationCenter.default.addObserver(self, selector: #selector(topMoviesUpdated), name: Notification.Name("topMoviesUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moviesUpdated), name: Notification.Name("moviesUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(otherMoviesUpdated), name: Notification.Name("otherMoviesUpdated"), object: nil)
        
    }

    @objc private func moviesUpdated(notification: NSNotification) {
        self.welcomeLabel.text = "Welcome home, " + (currentUser?.username ?? "Steven")
        
        for movie in movies {
            if Double(movie.movieRating!)! >= 6.0 {
                topMovies.append(movie)
            }
            else {
                otherMovies.append(movie)
            }
        }
    }
    @objc private func otherMoviesUpdated(notification: NSNotification) {
        self.moviesCollection.reloadData()
    }
    @objc private func topMoviesUpdated(notification: NSNotification) {
        self.topMoviesCollection.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        if (movies.isEmpty) { Task { movies = await NetworkClient.requestMovies() } }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // navigate to favourite screen
    @IBAction func favouritesBtnPressed(_ sender: Any) {
        let targetStoryboard = UIStoryboard(name: "FavouriteMoviesList", bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "FavouriteMoviesList") as? FavouriteMoviesListController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
    }
    // navigate to actors screen
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
