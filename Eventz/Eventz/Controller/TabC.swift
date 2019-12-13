//
//  TabVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/13/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .blue
        setupTabBar()
    }
    
    // MARK: - Helper Functions
    
    fileprivate func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.title = "Home"
        // homeVC.tabBarItem.image =
        // homeVC.tabBarItem.selectedImage =
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem.title = "Profile"
        // profileVC.tabBarItem.image =
        // profileVC.tabBarItem.selectedImage =
        
        viewControllers = [homeVC, profileVC]
        
    }
    
}
