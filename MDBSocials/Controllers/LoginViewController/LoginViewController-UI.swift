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
        self.view.backgroundColor = Constants.blue
        displaySocialsImage()
        displayUsername()
        displayPassword()
        displayLogin()
        displaySignUp()
    }
    
    func displaySocialsImage() {
        socialsImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 300))
        socialsImage.center = CGPoint(x: view.frame.width / 2, y: 250)
        socialsImage.image = UIImage(named: "socialsIcon")
        view.addSubview(socialsImage)
    }
    
    func displayUsername() {
        userName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        userName.center = CGPoint(x: view.frame.width/2, y: socialsImage.frame.maxY + 35)
        userName.placeholder = " Email:"
        userName.layer.cornerRadius = 15
        userName.backgroundColor = .white
        view.addSubview(userName)
    }
    
    func displayPassword() {
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        password.center = CGPoint(x: view.frame.width/2, y: userName.frame.maxY + 35)
        password.placeholder = " Password (>6 characters):"
        password.layer.cornerRadius = 15
        password.backgroundColor = .white
        password.isSecureTextEntry = true
        view.addSubview(password)
    }
    
    func displayLogin() {
        loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 35))
        loginButton.center = CGPoint(x: view.frame.width / 2, y: password.frame.maxY + 50)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = Constants.orange
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func displaySignUp() {
        signUpButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: 35))
        signUpButton.center = CGPoint(x: view.frame.width / 2, y: loginButton.frame.maxY + 60)
        signUpButton.setTitle("No Account? Sign Up!", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = Constants.orange
        signUpButton.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    @objc func toSignUp() {
        performSegue(withIdentifier: "toSignUpVC", sender: self)
    }

}
