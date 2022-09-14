//
//  customCollectionViewCell.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit


class CustomCollectionViewCell: UICollectionViewCell {
    func loadIm(url: URL) -> Void{
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.img.image = image
                    }
                }
            }
        }
    }
    
    var movie: Movie?
    
    @IBOutlet weak var img: UIImageView!
    
    // fill with movies with rate < 4.0
    func configureCell(id: Int) {
        self.movie = topMovies[id]
        loadIm(url: URL(string: (self.movie?.movieImageURL)!)!)
        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
    }
}

class CustomMoviesCollectionViewCell: UICollectionViewCell {
    func loadIm(url: URL) -> Void{
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.img.image = image
                    }
                }
            }
        }
    }
    var movie: Movie?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    // fill with movies with rate < 4.0
    func configureCell(id: Int) {
        self.movie = movies[id]
        loadIm(url: URL(string: (self.movie?.movieImageURL)!)!)
        self.name.text = self.movie?.movieName
        self.duration.text = self.movie?.movieDuration

        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
    }
}
