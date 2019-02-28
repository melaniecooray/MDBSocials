//
//  sdfsdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

extension FeedViewController {

    func initUI() {
        setupNavBar()
        setupTableView()
        setupSignOutButton()
        setupAddEventButton()
    }
    
    func setupNavBar() {
        self.navigationItem.title = "Feed"
        self.navigationController?.navigationBar.tintColor = Constants.orange
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height - 30))
        tableView.register(FeedCell.self,forCellReuseIdentifier: "feedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Constants.blue;
        view.addSubview(tableView)
    }
    
    func setupSignOutButton() {
        signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        //self.navigationItem.rightBarButtonItem = signOutButton
        self.navigationItem.setLeftBarButton(signOutButton, animated: true)
    }
    
    func setupAddEventButton() {
        /*
        addEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        addEventButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 65)
        addEventButton.layer.cornerRadius = 0.5 * addEventButton.bounds.size.width
        addEventButton.backgroundColor = Constants.orange
        addEventButton.addTarget(self, action: #selector(toNew), for: .touchUpInside)
        addEventButton.setBackgroundImage(UIImage(named: "addIcon2"), for: .normal)
        view.addSubview(addEventButton)
        */
        addEventButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toNew))
        self.navigationItem.setRightBarButton(addEventButton, animated: true)
    }
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            let alertController = UIAlertController(title: "Error Logging Out", message:
                signOutError.debugDescription, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        performSegue(withIdentifier: "toLoginVC", sender: nil)
    }
    
    @objc func toNew() {
        self.performSegue(withIdentifier: "toNewVC", sender: self)
    }
    

}
