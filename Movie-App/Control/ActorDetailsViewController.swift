//
//  ActorViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit

class ActorDetailsViewController : UIViewController{
    
    var actor: Actor?

    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actor = actor {
            self.actorName.text = actor.name
            self.actorImage.image = UIImage(named: actor.image)
        }
    }
}
