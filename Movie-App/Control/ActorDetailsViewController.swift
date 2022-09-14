//
//  ActorViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit

class ActorDetailsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    func loadIm(url: URL) -> Void{
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.actorImage.image = image
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.actor?.actorMovies.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: Movie = (self.actor?.actorMovies[indexPath.row])!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorMoviesCell", for: indexPath) as! ActorMoviesCell
        cell.configureCell(info: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = actorMoviesTable.cellForRow(at: indexPath) as! ActorMoviesCell

        let targetStoryboardName = "MovieDetails"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)

        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "movieDetails") as? MovieDetailsViewController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
            targetViewController.movie = cell.movie
        }
    }
    var actor: Actor?

    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorMoviesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actor = actor {
            self.actorName.text = actor.actorName
            loadIm(url: URL(string: self.actor!.actorImageURL)!)
        }
    }
}
