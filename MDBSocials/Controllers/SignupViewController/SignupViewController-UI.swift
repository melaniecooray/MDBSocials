//
//  dfdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/21/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension SignupViewController {

    func initUI() {
        self.view.backgroundColor = Constants.blue
        displayFullName()
        displayEmail()
        displayUsername()
        displayPassword()
        displaySignupButton()
    }
    
    func displayFullName() {
        fullName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        fullName.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) - 100)
        fullName.placeholder = " Full Name:"
        fullName.layer.cornerRadius = 15
        fullName.backgroundColor = .white
        view.addSubview(fullName)
    }
    
    func displayEmail() {
        email = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        email.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) - 25)
        email.placeholder = " Email:"
        email.layer.cornerRadius = 15
        email.backgroundColor = .white
        view.addSubview(email)
    }
    
    func displayUsername() {
        username = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        username.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) + 50)
        username.placeholder = " Username:"
        username.layer.cornerRadius = 15
        username.backgroundColor = .white
        view.addSubview(username)
    }
    
    func displayPassword() {
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        password.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/2) + 125)
        password.placeholder = " Password:"
        password.layer.cornerRadius = 15
        password.backgroundColor = .white
        view.addSubview(password)
    }
    
    func displaySignupButton() {
        signupButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 200, height: 100))
        signupButton.center = CGPoint(x: password.frame.midX, y: password.frame.maxY + 75)
        signupButton.backgroundColor = Constants.orange
        signupButton.setTitle("Create Account", for: .normal)
        signupButton.layer.cornerRadius = 15
        signupButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        view.addSubview(signupButton)
    }
}
