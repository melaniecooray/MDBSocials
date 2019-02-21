//
//  sdf.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/21/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension DetailViewController {

    func initUI() {
        self.navigationItem.title = "Details"
        self.navigationController?.navigationBar.tintColor = Constants.orange
        setupImage()
        setupInterested()
        setupEventName()
        setupPosterName()
        setupEventDescription()
    }
    
    func setupImage() {
        eventImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 200, height: view.frame.width - 200))
        eventImage.center = CGPoint(x: view.frame.width / 2, y: eventImage.frame.height / 2 + 130)
        view.addSubview(eventImage)
    }
    
    func setupInterested() {
        interestButton = UIButton(frame: CGRect(x: eventImage.frame.minX, y: eventImage.frame.maxY + 10, width: eventImage.frame.width, height: 40))
        interestButton.setTitle("Interested?", for: .normal)
        interestButton.backgroundColor = Constants.orange
        //UIButton notSelected = UIButton(frame: CGRect(x: interestButton.frame.minX + 10, y: interestButton.frame.midY + 15))  MAKE CHECKABLE
        
        //interestButton.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        interestButton.layer.cornerRadius = 0.5
        view.addSubview(interestButton)
        
        /*
        numRSVP = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventImage.frame.maxY + 5, width: 150, height: 20))
        numRSVP.text = "INTERESTED: ?"
        view.addSubview(numRSVP)
         */
    }
    
    func setupEventName() {
        eventName = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventImage.frame.maxY + 10, width: view.frame.width, height: 40))
        eventName.text = "EVENT NAME FROM DATABASE"
        eventName.textAlignment = .left
        view.addSubview(eventName)
    }
    
    func setupPosterName() {
        posterName = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventName.frame.maxY + 10, width: view.frame.width, height: 20))
        posterName.text = "NAME OF POSTER"
        posterName.textAlignment = .left
        view.addSubview(posterName)
    }
    
    func setupEventDescription() {
        eventDesc = UILabel(frame: CGRect(x: eventImage.frame.minX, y: posterName.frame.maxY + 10, width: view.frame.width, height: 20))
        eventDesc.text = "DESCRIPTION HERE"
        eventDesc.textAlignment = .center
        view.addSubview(eventDesc)
    }
    
    
}
