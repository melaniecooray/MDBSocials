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
    
    var socialEvent : [DataSnapshot] = []
    var dates : [String] = []
    var picArray : [UIImage] = []
    var eventCount = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Database.database().reference()
        let storage = Storage.storage().reference()
        //storage.getData(maxSize: 1000000) { (data, error) in
        //    let pic = UIImage(data: data)
        //
        //})
        let topNode = db.child("events")
        topNode.observe(.value, with: { (snapshot) in
            for event in snapshot.children {
                print("hi")
                self.eventCount += 1
                let newEvent = event as! DataSnapshot
                let dict = newEvent.value as! [String : Any]
                let date = dict["date"] as! String
                for i in 0..<self.dates.count {
                    if date < self.dates[i] {
                        self.socialEvent.insert(newEvent, at: i)
                        self.dates.insert(date, at: i)
                        break
                    }
                }
                self.socialEvent.append(newEvent)
                self.dates.append(date)
            }
            
            self.initUI()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
