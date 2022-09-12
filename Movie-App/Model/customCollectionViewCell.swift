//
//  customCollectionViewCell.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    var id: Int?
    
    func configureCell(id: Int) {
        self.id = id
    }
}
