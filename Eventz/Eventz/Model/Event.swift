//
//  Event.swift
//  Eventz
//
//  Created by Max Nabokow on 11/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation

struct Event {
    
    // MARK: - Properties
    var id: String
    
    var title: String
    var category: String
    var description: String?
    var date: Date
    var location: String
    
    var interests: [String]
    
    var imageURL: String?
    
    var organizerId: String
    
    // ???
//    var attendeeIds: [String]
}
