//
//  sdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/21/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension LoginViewController {

    func initUI() {
        self.view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        displayUsername()
        displayPassword()
        displaySignUp()
        displayLogin()
    }
    
    func displayUsername() {
        userName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        userName.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        userName.placeholder = " Username"
        userName.layer.cornerRadius = 15
        userName.backgroundColor = .white
        view.addSubview(userName)
    }
    
    func displayPassword() {
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        password.center = CGPoint(x: view.frame.width/2, y: userName.frame.maxY + 50)
        password.placeholder = " Password (>6 characters)"
        password.layer.cornerRadius = 15
        password.backgroundColor = .white
        password.isSecureTextEntry = true
        view.addSubview(password)
    }
    
    func displaySignUp() {
        signUpButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: 35))
        signUpButton.center = CGPoint(x: view.frame.width/2, y: password.frame.maxY + 300)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        signUpButton.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    func displayLogin() {
        loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 35))
        loginButton.center = CGPoint(x: view.frame.width/2, y: password.frame.maxY + 50)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    @objc func toSignUp() {
        performSegue(withIdentifier: "toSignUpVC", sender: self)
    }

}
