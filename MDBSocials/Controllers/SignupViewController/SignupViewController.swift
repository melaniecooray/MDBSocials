//
//  SignupViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/17/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    var fullName : UITextField!
    var email : UITextField!
    var username : UITextField!
    var password : UITextField!
    var signupButton : UIButton!
    
    var userID : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = Constants.orange
        self.title = "Sign Up!"
        
        // Do any additional setup after loading the view.
        
        initUI();
        registerUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func registerUser() {
        var userName : String!
        var userEmail : String!
        var userPassword : String!
        var userUsername : String!
        
        if let newName = fullName.text {
            userName = newName
        }
        
        if let em = email.text {
            userEmail = em
        }
        
        if let pass = password.text {
            userPassword = pass
        }
        
        if let uname = username.text {
            userUsername = uname
        }
        
        if fullName.text == "" {
            self.signupButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Name Entered")
            return
        }
        
        if email.text == "" {
            self.signupButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Email Entered")
            return
        }
        
        if password.text == "" {
            self.signupButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Password Entered")
            return
        }
        
        if username.text == "" {
            self.signupButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Username Entered")
            return
        }
        
        
        Auth.auth().createUser(withEmail: userEmail!, password: userPassword!, completion: { (user, error) in
            if let error = error {
                self.signupButton.isUserInteractionEnabled = true
                print(error)
                self.showError(title: "Error:", message: "Could not register user.")
                return
            } else {
                guard (user?.user.uid) != nil else {
                    return
                }
                let ref = Database.database().reference()
                let userRef = ref.child("users").child(userUsername!)
                let values = ["Name": userName, "Username": userUsername, "Email": userEmail]
                
                userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    if error != nil {
                        print(error)
                        return
                    } else {
                        self.userID = user?.user.uid
                        self.performSegue(withIdentifier: "toFeedVC", sender: self)
                    }
                })
            }
        })
    }
    
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFeedVC" {
            let destination = segue.destination as! FeedViewController
            destination.userID = userID
        }
    }
}
