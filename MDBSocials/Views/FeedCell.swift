//
//  FeedCell.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    var size : CGSize!
    
    var eventImage : UIImageView!
    var eventName : UILabel!
    var posterName : UILabel!
    var numRSVP : UILabel!

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
        eventImage.center = CGPoint(x: self.size.width / 2, y: self.size.width / 2 + 25)
        contentView.addSubview(eventImage)
        
        eventName = UILabel(frame: CGRect(x: eventImage.frame.minX, y: eventImage.frame.maxY + 5, width: self.size.width - 50, height: 12))
        eventName.text = "EVENT NAME FROM DATABASE"
        eventName.textAlignment = .left
        contentView.addSubview(eventName)
        
        posterName = UILabel(frame: CGRect(x: eventName.frame.minX, y: eventName.frame.maxY, width: self.size.width - 50, height: 18))
        posterName.text = "NAME OF POSTER"
        posterName.textAlignment = .left
        contentView.addSubview(posterName)
        
        numRSVP = UILabel(frame: CGRect(x: eventImage.frame.maxX - 100, y: eventImage.frame.maxY + 5, width: 150, height: 20))
        numRSVP.text = "INTERESTED: ?"
        contentView.addSubview(numRSVP)
        
    }

}
