//
//  TabC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/13/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    fileprivate let homeVC: UINavigationController = {
        let vc = UINavigationController(rootViewController: HomeViewController())
        vc.tabBarItem.title = "Home"
        return vc
    }()
    
    fileprivate let profileVC: ProfileViewController = {
        let vc = ProfileViewController()
        vc.tabBarItem.title = "Profile"
        return vc
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.barTintColor = .white
        setupTabBar()
        roundCorners()
    }
    
    // MARK: - Helper Functions
    
    fileprivate func setupTabBar() {

        viewControllers = [homeVC, profileVC]
    }
}
