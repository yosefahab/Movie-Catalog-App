//
//  customCellView.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    var movie: Movie?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var director: UILabel!
    
    @IBAction func favouriteBtnPressed(_ sender: Any) {
        if let movie = self.movie {
            if movie.isFavourite == true {
                self.favourite.setImage(UIImage(systemName: "heart"), for: .normal)
                self.movie?.isFavourite = false
            }
            else{
                self.favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.movie?.isFavourite = true
                currentUser?.userFavourite?.append(movie)
            }
        }
    }
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
    func configureCell(info: Movie){
        // cell data
        self.movie = info
        self.name.text = info.movieName
        self.rating.text = info.movieRating
        self.category.text = info.movieCategory
        self.duration.text = info.movieDuration
        self.year.text = info.movieProductionYear
        self.director.text = info.directorName
        
//         cell view properties
        if info.isFavourite == true {
            self.favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            self.favourite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        loadIm(url: URL(string: info.movieImageURL!)!)
        self.cellView.layer.cornerRadius = 12
        self.img.layer.cornerRadius = 12
    }
    
}
