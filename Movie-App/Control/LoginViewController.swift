//
//  ViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 10/09/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var dismissCallBack: (()->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let targetStoryboardName = "Register"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController  {
            present(targetViewController, animated: true, completion: nil)
        }
    }
    
}

