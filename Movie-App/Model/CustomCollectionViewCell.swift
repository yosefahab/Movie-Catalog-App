//
//  customCollectionViewCell.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    var id: Int?
    
    func configureCell(id: Int) {
        self.id = id
        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
        // fill with movies with rate < 4.0
    }
}

class CustomMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    var id: Int?
    
    func configureCell(id: Int) {
        self.id = id
        self.img.layer.cornerRadius = 12
        self.layer.cornerRadius = 12
        // fill with movies with rate < 4.0
    }
}
