//
//  FeedViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/19/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class FeedViewController: UIViewController {
    
    var tableView : UITableView!
    var cellSize : CGSize!
    
    var addEventButton : UIButton!
    var signOutButton: UIBarButtonItem!
    
    var userID : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func getData() {
        let db = Database.database().reference()
        let topNode = db.child("events")
        topNode.observe(.value, with: { (snapshot) in
            for event in snapshot.children {
                
            }
            })
    }
}
