//
//  customCollectionViewCell.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    func configureCell(id: Int) {
        // fill with movies with rate < 4.0
//        self.img.image = NetworkClient.downloadImage(from: <#T##URL#>)

        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
    }
}

class CustomMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    func configureCell(id: Int) {
        self.name.text = movies[id].movieName
        self.duration.text = movies[id].movieDuration
        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
        // fill with movies with rate < 4.0
    }
}
