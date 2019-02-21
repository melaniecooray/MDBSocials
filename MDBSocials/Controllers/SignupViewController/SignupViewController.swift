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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = Constants.orange
        self.title = "Sign Up!"

        // Do any additional setup after loading the view.
        
        initUI();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

}
