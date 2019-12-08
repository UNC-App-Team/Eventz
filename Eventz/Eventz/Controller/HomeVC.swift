//
//  HomeVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/8/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools

class HomeViewController: UIViewController {
    
    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if (!loggedIn) {
            present(LoginViewController(), animated: true)
        }
    }
    
}
