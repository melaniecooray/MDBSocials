//
//  FeedViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/19/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var tableView : UITableView!
    var cellSize : CGSize!
    
    var addEventButton : UIButton!
    var signOutButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
}
