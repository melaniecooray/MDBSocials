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
    
    var addEventButton : UIBarButtonItem!
    var signOutButton: UIBarButtonItem!
    
    var userID : String!
    
    var events : [Event] = []
    var socialEvent : [DataSnapshot] = []
    var dates : [String] = []
    var picArray : [UIImage] = []
    var eventCount = 0
    var index = 0
    
    var clicked : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        socialEvent = []
        dates = []
        events = []
        eventCount = 0
        let db = Database.database().reference()
        let topNode = db.child("events")
        topNode.observe(.value, with: { (snapshot) in
            for event in snapshot.children {
                print("hi")
                self.eventCount += 1
                let newEvent = event as! DataSnapshot
                let dict = newEvent.value as! [String : Any]
                let date = dict["date"] as! String
                let event1 = Event(name: dict["name"] as! String, image: dict["image"] as! String, description: dict["description"] as! String, date: dict["date"] as! String, eventID: dict["eventID"] as! String, interested: dict["interested"] as! Int)
                for i in 0..<self.dates.count {
                    if date < self.dates[i] {
                        self.socialEvent.insert(newEvent, at: i)
                        self.events.insert(event1, at: i)
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
}
