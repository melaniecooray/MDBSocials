//
//  SignupViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/17/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    var fullName : UITextField!
    var email : UITextField!
    var username : UITextField!
    var password : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        displayFullName()
        displayEmail()
        displayUsername()
        displayPassword()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func displayFullName() {
        fullName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        fullName.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) - 100)
        fullName.placeholder = "Full Name"
        fullName.layer.cornerRadius = 15
        fullName.backgroundColor = .white
        view.addSubview(fullName)
    }
    
    func displayEmail() {
        email = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        email.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) - 25)
        email.placeholder = "Email"
        email.layer.cornerRadius = 15
        email.backgroundColor = .white
        view.addSubview(email)
    }
    
    func displayUsername() {
        username = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        username.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) + 50)
        username.placeholder = "Username"
        username.layer.cornerRadius = 15
        username.backgroundColor = .white
        view.addSubview(username)
    }
    
    func displayPassword() {
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        password.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) + 125)
        password.placeholder = "Password"
        password.layer.cornerRadius = 15
        password.backgroundColor = .white
        view.addSubview(password)
    }

}
