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
        self.navigationItem.title = "Create Social"
        self.navigationController?.navigationBar.tintColor = Constants.orange
        displayTitle()
        displayDescription()
        setUpDatePicker()
        displayImageButton()
        displayAddButton()
    }
    
    func displayTitle() {
        nameOfEvent = UITextField(frame: CGRect(x: 25, y: 150, width: view.frame.width/2 + 30, height: 70))
        nameOfEvent.placeholder = "Name of Event"
        nameOfEvent.layer.cornerRadius = 5
        nameOfEvent.backgroundColor = Constants.blue
        view.addSubview(nameOfEvent)
    }
    
    func displayImageButton() {
        imageButton = UIButton(frame: CGRect(x: nameOfEvent.frame.maxX + 20, y: 150, width: view.frame.width/4, height: 70))
        imageButton.setTitle("Image", for: .normal)
        imageButton.layer.cornerRadius = 5
        imageButton.setTitleColor(.black, for: .normal)
        imageButton.backgroundColor = Constants.blue
        imageButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        view.addSubview(imageButton)
    }
    
    func displayDescription() {
        eventDescription = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 200))
        eventDescription.center = CGPoint(x: view.frame.width/2, y: nameOfEvent.frame.maxY + 150)
        eventDescription.placeholder = "Description"
        eventDescription.layer.cornerRadius = 15
        eventDescription.backgroundColor = Constants.blue
        view.addSubview(eventDescription)
    }
    
    func setUpDatePicker() {
        datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        datePicker.center = CGPoint(x: view.frame.width/2, y: eventDescription.frame.maxY + 100)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
    }
    
    func displayAddButton() {
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: 30))
        addButton.center = CGPoint(x: view.frame.width/2, y: datePicker.frame.maxY + 50)
        addButton.setTitle("Post", for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = Constants.blue
        addButton.addTarget(self, action: #selector(addToFeed), for: .touchUpInside)
        view.addSubview(addButton)
    }
}
