//
//  sdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/21/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

extension DetailViewController {

    func initUI() {
        setupNavBar()
        setupEventName()
        setupImage()
        //setupPosterName()
        setupEventDescription()
        setupInterested()
    }
    
    func setupNavBar() {
        self.navigationItem.title = "Details"
        self.navigationController?.navigationBar.tintColor = Constants.orange
    }
    
    func setupImage() {
        eventImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: view.frame.width - 50))
        eventImage.center = CGPoint(x: view.frame.width / 2, y: eventName.frame.maxY + 250)
        let storage = Storage.storage().reference()
        var dict = event.value as! [String : Any]
        let name = dict["name"] as! String
        let image = storage.child("\(name).jpeg")
        image.getData(maxSize: 10 * 1024 * 1024) { data, error in
            if error != nil {
                print(error)
                self.eventImage.image = UIImage(named: "pleasemyson")
            } else {
                print("sup bro")
                self.eventImage.image = UIImage(data: data!)
            }
        }
        view.addSubview(eventImage)
    }
    
    func setupInterested() {
        interestButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 40))
        interestButton.center = CGPoint(x: view.frame.width/2, y: eventDesc.frame.maxY + 50)
        interestButton.setTitle("Interested?", for: .normal)
        interestButton.backgroundColor = Constants.orange
        //UIButton notSelected = UIButton(frame: CGRect(x: interestButton.frame.minX + 10, y: interestButton.frame.midY + 15))  MAKE CHECKABLE
        
        //interestButton.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        interestButton.setTitle("Marked Interested!", for: .selected)
        interestButton.layer.cornerRadius = 10
        interestButton.addTarget(self, action: #selector(markInterested), for: .touchUpInside)
        view.addSubview(interestButton)
    }
    
    func setupEventName() {
        eventName = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        eventName.center = CGPoint(x: view.frame.width/2, y: 150)
        var dict = event.value as! [String : Any]
        eventName.text = dict["name"] as! String
        eventName.font = UIFont(name: "Avenir-Light", size: 70)
        eventName.textAlignment = .center
        view.addSubview(eventName)
    }
    
    //func setupPosterName() {
    //   posterName = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventName.frame.maxY + 50, width: view.frame.width, height: 20))
    //    posterName.text = "NAME OF POSTER"
    //    posterName.textAlignment = .left
    //    view.addSubview(posterName)
    //}
    
    func setupEventDescription() {
        eventDesc = UILabel(frame: CGRect(x: 0, y: eventImage.frame.maxY + 200, width: view.frame.width, height: 100))
        eventDesc.center = CGPoint(x: view.frame.width/2, y: 700)
        var dict = event.value as! [String : Any]
        eventDesc.text = dict["description"] as! String
        eventName.font = UIFont(name: "Avenir-Light", size: 25)
        eventDesc.textAlignment = .center
        view.addSubview(eventDesc)
    }
    
    
}
