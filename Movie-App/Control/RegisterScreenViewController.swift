//
//  RegisterScreenViewController.swift
//  Movie-App
//
//  Created by Omar Salem on 11/09/2022.
//

import UIKit

class RegisterViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func registerBtnPressed(_ sender: Any) {
        let targetStoryboardName = "Login"
        let targetStoryboard = UIStoryboard(name: targetStoryboardName, bundle: nil)
        if let targetViewController = targetStoryboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController  {
            targetViewController.dismissCallBack = {
                targetViewController.dismiss(animated: true)
            }
        }
    }
}
