//
//  CustomActorTableCell.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation
import UIKit

class CustomActorTableCell : UITableViewCell {
    var actor: Actor?
    
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    func loadIm(url: URL) -> Void{
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.actorImage.image = image
                    }
                }
            }
        }
    }
    
    func configureCell(info: Actor) {
        self.actor = info
        
        self.actorName.text = info.actorName

        loadIm(url: URL(string: self.actor!.actorImageURL)!)

        self.layer.cornerRadius = 12
        self.cellView.layer.cornerRadius = 12
        self.actorImage.layer.cornerRadius = 12
    }
}
