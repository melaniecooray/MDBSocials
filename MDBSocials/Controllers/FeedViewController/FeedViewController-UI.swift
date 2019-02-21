//
//  sdfsdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension FeedViewController {

    func initUI() {
        self.title = "Feed"
        self.navigationController?.navigationBar.tintColor = Constants.orange
        
        setupTableView()
        setupSignOutButton()
        setupAddEventButton()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height - 30))
        tableView.register(FeedCell.self,forCellReuseIdentifier: "feedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .blue;
    }
    
    func setupSignOutButton() {
        signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        self.navigationItem.rightBarButtonItem = signOutButton
    }
    
    func setupAddEventButton() {
        addEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        addEventButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 75)
        addEventButton.layer.cornerRadius = 0.5 * addEventButton.bounds.size.width
        addEventButton.backgroundColor = Constants.orange
        addEventButton.addTarget(self, action: #selector(toNew), for: .touchUpInside)
        view.addSubview(addEventButton)
    }
    
    @objc func signOut() {
        
    }
    
    @objc func toNew() {
        self.performSegue(withIdentifier: "toNewVC", sender: self)
    }
    

}
