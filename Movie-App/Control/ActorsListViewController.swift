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
        cell.selectionStyle = .none
        cell.configureCell(info: actor)
        return cell
    }
    override func viewWillDisappear(_ animated: Bool) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromRight
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        
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
