//
//  File.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/27/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class Event {
    let eventID : String!
    let name : String!
    let image : String!
    let description : String!
    let date : String!
    let interested : Int!
    
    init(name: String, image: String, description: String, date: String, eventID: String, interested: Int) {
        self.name = name
        self.image = image
        self.description = description
        self.date = date
        self.eventID = eventID
        self.interested = interested
    }
    
}
