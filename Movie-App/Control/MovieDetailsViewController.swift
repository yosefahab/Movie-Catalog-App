//
//  MovieDetailsViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit
import WebKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            movieName.text = movie.name
            movieDirector.text = movie.director
            movieCategory.text = movie.category
            movieYear.text = "(" + movie.year + ")"
            movieDuration.text = movie.time
            movieRating.text = movie.rating
        }
    }
}
