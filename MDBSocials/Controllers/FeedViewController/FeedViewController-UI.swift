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
        setupTableView()
        setupSignOutButton()
        setupAddEventButton()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: viewSelect.frame.maxY, width: view.frame.width, height: view.frame.height - 30))
        tableView.register(FeedCell.self,forCellReuseIdentifier: "feedCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupSignOutButton() {
        
    }
    
    func setupAddEventButton() {
        addEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        addEventButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 100)
        addEventButton.layer.cornerRadius = 0.5 * addEventButton.bounds.size.width
        addEventButton.backgroundColor = Constants.orange
        addEventButton.addTarget(self, action: #selector(toNew), for: .touchUpInside)
        view.addSubview(addEventButton)
    }
    
    @objc func toNew() {
        self.performSegue(withIdentifier: "toNewVC", sender: self)
    }

}