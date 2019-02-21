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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //FirebaseApp.configure()
        
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

