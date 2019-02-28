//
//  ViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/13/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var userName : UITextField!
    var password : UITextField!
    
    var signUpButton : UIButton!
    var loginButton : UIButton!
    
    var userID : String!
    
    var socialsImage : UIImageView!
    
    var mdbsocialsLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MDBSocials"
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.alreadySignedIn()
            } else {
                self.initUI()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func loginUser() {
        var userUsername: String?
        var userPassword: String?
        
        if let usern = userName.text {
            userUsername = usern
        }
        
        if let pass = password.text {
            userPassword = pass
        }
        
        if userName.text == "" {
            self.loginButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Username Entered")
            return
        }
        
        if password.text == "" {
            self.loginButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Password Entered")
            return
        }
        
        loginButton.isEnabled = false
        loginButton.backgroundColor = .gray
        loginButton.setTitle("Loading...", for: .normal)

        Auth.auth().signIn(withEmail: userUsername!, password: userPassword!, completion: { (user, error) in
            if let error = error {
                self.loginButton.isUserInteractionEnabled = true
                print(error)
                self.showError(title: "Error:", message: "Could not sign in user.")
                return
            } else {
                self.userID = user?.user.uid
                self.performSegue(withIdentifier: "toFeedVC", sender: self)
            }
        })
    }
    
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alreadySignedIn () {
        performSegue(withIdentifier: "toFeedVC", sender: self)
    }
}

