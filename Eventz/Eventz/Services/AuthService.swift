//
//  AuthService.swift
//  Eventz
//
//  Created by Max Nabokow on 12/21/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import FirebaseAuth

class AuthService {
    
    private init() {}
    static let shared = AuthService()
    
    func getCurrentUserId() -> String? {
        
        return Auth.auth().currentUser?.uid
        
    }
    
    func isLoggedIn() -> Bool {
        
        return Auth.auth().currentUser != nil
    }
    
    func signIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signOut() throws {
        
        try Auth.auth().signOut()
    }
    
    func signUp(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func forgotPassword(forEmail email: String) {
        
        Auth.auth().sendPasswordReset(withEmail: email)
    }
}
