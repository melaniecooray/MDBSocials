//
//  DetailViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    var eventImage : UIImageView!
    var eventName : UILabel!
    
    var dateLabel : UILabel!
    
    var posterName : UILabel!
    
    var eventDesc : UILabel!
    
    var numRSVP : UILabel!
    
    var interestButton : UIButton!
    
    var notSelected : UIImage!
    var selected : UIImage!
    
    var event : DataSnapshot!
    var eventID : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    @objc func markInterested() {
        interestButton.setTitleColor(.gray, for: .disabled)
        var dict = event.value as! [String : Any]
        let db = Database.database().reference()
        var update = dict["interested"] as! Int
        update = update + 1
        db.child("events").child(dict["eventID"] as! String).updateChildValues(["interested" : update])
        
    }
}
