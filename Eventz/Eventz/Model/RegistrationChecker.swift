//
//  RegistrationChecker.swift
//  Eventz
//
//  Created by Max Nabokow on 12/22/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation

struct RegistrationChecker {
    
    var firstName: String? { didSet { checkFormValidity() }}
    var lastName: String? { didSet { checkFormValidity() }}
    var email: String? { didSet { checkFormValidity() }}
    var password: String? { didSet { checkFormValidity() }}
    
    var observer: ((Bool) -> ())?
    
    fileprivate func checkFormValidity() {
        var isFormValid = false
        
        if
            let first = firstName,
            let last = lastName,
            let email = email,
            let password = password
        {
            isFormValid =
                !first.isEmpty &&
                !last.isEmpty &&
                email.contains("@") &&
                email.hasSuffix("unc.edu") &&
                password.count >= 8
        }
        
        observer?(isFormValid)
    }
}
