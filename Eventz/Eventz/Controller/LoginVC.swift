//
//  LoginViewController.swift
//  Eventz
//
//  Created by Beliz Yilmaz on 11/6/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation
import LBTATools

class LoginViewController: UIViewController {
    
    let openingForTheFirstTime = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        
        // Doesn't work, can't present on a presented VC :(
        if !openingForTheFirstTime {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let welcomeVC = WelcomeViewController(collectionViewLayout: layout)
            welcomeVC.modalPresentationStyle = .fullScreen
            navigationController?.present(welcomeVC, animated: false, completion: nil)
        }
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
    }
    
    fileprivate func setupLayout() {
        
    }
    
    // MARK: - Selectors
    
    @objc func showHomeViewController() {
        dismiss(animated: true)
    }
    
    // MARK: - Helper Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


