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
    
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var age: Int
    var hometown: String
    
    lazy var displayName: String = {
        return "\(firstName) \(lastName)"
    }()
    
//    var profilePicURL: String?
//    var interests: [String?]?
    
    // MARK: - Init
    init(id: String, firstName: String?, lastName: String?, email: String?, age: Int?, hometown: String?, profilePicURL: String?, interests: [String?]?) {
        self.id = id
        self.firstName = firstName ?? "firstName"
        self.lastName = lastName ?? "lastName"
        self.email = email ?? "email"
        self.age = age ?? -1
        self.hometown = hometown ?? "Unknown"
//        self.profilePicURL = profilePicURL
//        self.interests = interests
    }
}
