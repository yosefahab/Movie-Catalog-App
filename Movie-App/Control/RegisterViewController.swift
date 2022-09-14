//
//  RegisterScreenViewController.swift
//  Movie-App
//
//  Created by Omar Salem on 11/09/2022.
//

import UIKit

class RegisterViewController : UIViewController{
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    
    func isValidCreds(username: String, email: String, password: String, confirm: String) -> Bool {
        return true
        //        let reg = "^(?!\\s*$).+"
//        let pred = NSPredicate(format:"SELF MATCHES %@", reg)
//
//        return pred.evaluate(with: email) && pred.evaluate(with: password) && pred.evaluate(with: username) && pred.evaluate(with: confirm) && (confirm == password)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func signInBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func registerBtnPressed(_ sender: Any) {
        let username: String = usernameField.text!
        let email: String = emailField.text!
        let password: String = passwordField.text!
        let confirm: String = confirmField.text!
        
        if isValidCreds(username: username, email: email, password: password, confirm: confirm) {
            Task {
                currentUser = await NetworkClient.requestRegister(username:"tester", email:"tester@yahoo.com", password: "tester")
                if currentUser != nil { self.dismiss(animated: true) }
            }
        }
    }
}
