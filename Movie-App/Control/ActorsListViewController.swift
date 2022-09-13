//
//  ActorsListViewController.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation
import UIKit
class ActorsListViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var actorsTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let actor: Actor = actors[indexPath.row]
        let cell = actorsTable.dequeueReusableCell(withIdentifier: "actorTableCell", for: indexPath) as! CustomActorTableCell
        cell.configureCell(info: actor)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actor = actors[indexPath.row]
        
        let targetStoryboardName = "ActorDetails"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)

        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "ActorDetails") as? ActorDetailsViewController {
            self.navigationController?.pushViewController(targetViewController, animated: true)
            targetViewController.actor = actor
        }
    }
}
