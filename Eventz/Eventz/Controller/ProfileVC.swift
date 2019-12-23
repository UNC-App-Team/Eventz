//
//  ProfileVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/13/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools

class ProfileViewController: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate let profilePhotoBackgroundView: UIView = {
        let v = UIView(backgroundColor: .white)
        v.setupShadow(opacity: 0.6, radius: 4, offset: .init(width: 4, height: 4), color: .black)
        return v
    }()
    
    fileprivate let profilePhotoImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "girl 1"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        return iv
    }()
    
    fileprivate let bottomView: UIView = {
        let v = UIView(backgroundColor: .white)
        v.layer.cornerRadius = 36
        v.setupShadow(opacity: 0.8, radius: 4, offset: .init(width: 4, height: 4), color: .black)
        return v
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        profilePhotoBackgroundView.layer.cornerRadius = profilePhotoBackgroundView.frame.height / 2
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.height / 2
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .carolinaBlue
        roundCorners()
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupLayout() {
        view.addSubview(profilePhotoBackgroundView)
        profilePhotoBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        profilePhotoBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        profilePhotoBackgroundView.widthAnchor.constraint(equalTo: profilePhotoBackgroundView.heightAnchor).isActive = true
        profilePhotoBackgroundView.centerXToSuperview()
        
        view.addSubview(profilePhotoImageView)
        profilePhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        profilePhotoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        profilePhotoImageView.widthAnchor.constraint(equalTo: profilePhotoImageView.heightAnchor).isActive = true
        profilePhotoImageView.centerXToSuperview()
        
        view.addSubview(bottomView)
        bottomView.anchor(top: profilePhotoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
    }
}
