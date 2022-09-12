//
//  ActorsListViewController.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation
import UIKit
class ActorsListViewController:UIViewController,UITableViewDelegate,UITableViewDataSource

{
    @IBOutlet weak var actorTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let actor = actors[indexPath.row]
        let cell = actorTable.dequeueReusableCell(withIdentifier: "actorTableCell", for: indexPath) as! CustomActorTableCell
        cell.ActorImage.image = UIImage(named: "pic")
        cell.ActorImage.layer.cornerRadius = 12
        cell.ActorName.text = actor.name
        return cell
    }
    
    
}
