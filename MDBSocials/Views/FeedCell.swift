//
//  FeedCell.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    var size : CGSize!
    
    var eventImage : UIImageView!
    var eventName : UILabel!
    var posterName : UILabel!
    var dateLabel : UILabel!
    var numRSVP : UILabel!
    var humanIcon : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        
        eventImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.size.width - 100, height: self.size.width - 100))
        eventImage.center = CGPoint(x: self.size.width / 2, y: eventImage.frame.height / 2 + 50)
        eventImage.image = UIImage(named: "pleasemyson")
        contentView.addSubview(eventImage)
        
        eventName = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventImage.frame.maxY + 10, width: self.size.width - 50, height: 40))
        eventName.textAlignment = .left
        eventName.text = "Save Guy Fieri's Son"
        eventName.font = UIFont(name: "Avenir-Heavy", size: 35)
        contentView.addSubview(eventName)
        
        posterName = UILabel(frame: CGRect(x: eventName.frame.minX, y: eventName.frame.maxY + 10, width: self.size.width - 50, height: 40))
        posterName.textAlignment = .left
        posterName.text = "By: Guy Fieri"
        posterName.font = UIFont(name: "Avenir-Light", size: 30)
        contentView.addSubview(posterName)
        
        humanIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        humanIcon.center = CGPoint(x: self.size.width / 2 - 25, y: posterName.frame.maxY + 30)
        humanIcon.image = UIImage(named: "humanIcon")
        contentView.addSubview(humanIcon)
        
        numRSVP = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        numRSVP.center = CGPoint(x: self.size.width / 2 + 100, y: humanIcon.frame.midY)
        numRSVP.text = ": 20"
        numRSVP.font = UIFont(name: "Avenir-Black", size: 30)
        numRSVP.textAlignment = .left
        contentView.addSubview(numRSVP)
        
    }
    
    func updateEvent(to socialEvent : DataSnapshot) {
        let dict = socialEvent.value as! [String : Any]
        eventName.text = dict["name"] as! String
        posterName.text = "Melanie"
        let interested = dict["interested"]!
        numRSVP.text = "Interested: \(interested)"
    }

}
