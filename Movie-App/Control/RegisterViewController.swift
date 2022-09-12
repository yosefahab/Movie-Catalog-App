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
        self.dismiss(animated: true)
    }
}
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//    if (appDelegate.window?.rootViewController?.presentedViewController) != nil
//    {
//        appDelegate.window?.rootViewController?.remove(<#T##UIKeyCommand#>)
//        // Array of all viewcontroller even after presented
//    }
//    else if (appDelegate.window?.rootViewController?.children) != nil
//    {
//        // Array of all viewcontroller after push
//    }
