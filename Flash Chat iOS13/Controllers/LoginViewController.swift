//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            if email != "" && password != "" {
                let firebaseAuth =  Auth.auth()
               firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        self.showErrorAlert(explanation: e.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: K.loginToChatSegueID, sender: self)
                    }
                }
            } else {
                self.showErrorAlert(explanation: "Both email and password are required!")
            }
        }
    }
    
    func showErrorAlert(explanation message: String) {
        // create the alert
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
