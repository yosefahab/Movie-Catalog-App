//
//  ViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 10/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpClicked(_ sender: Any) {
        let targetStoryboardName = "Register"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Register") as? RegisterScreenViewController  {
            present(targetViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(targetViewController, animated: true)
            

        }
    }
    
}

