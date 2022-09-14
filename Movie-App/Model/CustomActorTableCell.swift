//
//  CustomActorTableCell.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation
import UIKit

class CustomActorTableCell : UITableViewCell {
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    func configureCell(info: Actor) {
        self.actorName.text = info.actorName

        self.layer.cornerRadius = 12
        self.cellView.layer.cornerRadius = 12

        self.actorImage.image = UIImage(named: info.actorImageURL)
        self.actorImage.layer.cornerRadius = 12
    }
}
