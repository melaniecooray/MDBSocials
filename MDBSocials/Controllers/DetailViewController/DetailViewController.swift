//
//  DetailViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var eventImage : UIImageView!
    var eventName : UILabel!
    var posterName : UILabel!
    var eventDesc : UILabel!
    var numRSVP : UILabel!
    var interestButton : UIButton!
    var notSelected : UIImage!
    var selected : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initUI()
    }
}
