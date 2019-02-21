//
//  sdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/21/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension NewSocialViewController {

    func initUI() {
        displayTitle()
        displayDescription()
        displayImageButton()
    }
    
    func displayTitle() {
        nameOfEvent = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 75))
        nameOfEvent.center = CGPoint(x: view.frame.width/2, y: 150)
        nameOfEvent.placeholder = "Name of Event"
        nameOfEvent.layer.cornerRadius = 15
        nameOfEvent.backgroundColor = .white
        view.addSubview(nameOfEvent)
    }
    
    func displayDescription() {
        eventDescription = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 200))
        eventDescription.center = CGPoint(x: view.frame.width/2, y: nameOfEvent.frame.maxY + 50)
        eventDescription.placeholder = "Description"
        eventDescription.layer.cornerRadius = 15
        eventDescription.backgroundColor = .white
        view.addSubview(eventDescription)
    }
    
    func displayImageButton() {
        imageButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: 35))
        imageButton.center = CGPoint(x: view.frame.width/2, y: datePicker.frame.maxY + 50)
        imageButton.setTitle("Sign Up", for: .normal)
        imageButton.layer.cornerRadius = 15
        imageButton.setTitleColor(.black, for: .normal)
        imageButton.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        imageButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        view.addSubview(imageButton)
    }
    
}
