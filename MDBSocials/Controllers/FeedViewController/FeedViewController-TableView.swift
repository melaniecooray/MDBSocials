//
//  lkmo.swift
//  MDBSocials
//
//  Created by Tyler Reinecke on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

extension FeedViewController : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.cellSize = CGSize(width: view.frame.width, height: view.frame.width + 140)
        return self.cellSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventCount//SHOULD BE NUMBER OF EVENTS FROM DATABASE
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.initCellFrom(size: CGSize(width: view.frame.width, height: view.frame.width + 200))
        //event = read event from database
        if let event = socialEvent {
            cell.updateEvent(to: event)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //social = Database.socials[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
}
