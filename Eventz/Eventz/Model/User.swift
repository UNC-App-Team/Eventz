//
//  User.swift
//  Eventz
//
//  Created by Max Nabokow on 11/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation

struct User {
    
    // MARK: - Properties
    
    var firstName: String
    var lastName: String
    var age: Int?
    var hometown: String?
    
//    var profilePicURL: String?
//    var interests: [String?]?
    
    // MARK: - Init
    init(firstName: String, lastName: String, age: Int? = -1, hometown: String? = "Unknown", profilePicURL: String?, interests: [String?]?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.hometown = hometown
//        self.profilePicURL = profilePicURL
//        self.interests = interests
    }
}
