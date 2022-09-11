//
//  customCellView.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit

class customTableCell: UITableViewCell {
    
    var saveToFav: (()->Void)?
    var movie: Movie?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    @IBAction func saveActionButton(_ sender: Any) {
//        saveToFav!()
        if let movie = self.movie {
            if movie.isFavourite == true {
                self.favourite.setImage(UIImage(systemName: "heart"), for: .normal)
                self.movie?.isFavourite = false
            }
            else{
                self.favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.movie?.isFavourite = true
            }
        }
    }
    
    func configureCell(info: Movie){
        // cell data
        self.movie = info
        self.name.text = info.name
        self.rating.text = info.rating
        self.category.text = info.category
        self.duration.text = info.duration
        
        // cell view properties
        self.cellView.layer.cornerRadius = 12
        // TODO: Change movie model in accordance to backend
        self.img.image = UIImage(systemName: "person")
    }
    
}
