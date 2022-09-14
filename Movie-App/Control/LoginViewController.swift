//
//  ViewController.swift
//  Movie-App
//
//  Created by Youssef Ahab on 10/09/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isValidCreds(email: String, password: String) -> Bool {
        let reg = "^(?!\\s*$).+"
        let pred = NSPredicate(format:"SELF MATCHES %@", reg)
        return pred.evaluate(with: email) && pred.evaluate(with: password)
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        let email: String = emailField.text!
        let password: String = passwordField.text!
        
        if isValidCreds(email: email, password: password) {
            Task {
                currentUser = await NetworkClient.requestLogin(email: email, password: password)
                if (currentUser != nil) {
                    movies = await NetworkClient.requestMovies()
                    actors = await NetworkClient.requestActors()
                    self.dismiss(animated: true)
                }
            }
        }
        else {
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let targetStoryboardName = "Register"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController  {
            present(targetViewController, animated: true, completion: nil)
        }
    }
    
}

