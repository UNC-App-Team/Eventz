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
    
    fileprivate let penButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        return b
    }()
    
    fileprivate let nameLabel: UILabel = {
        let l = UILabel(text: "Maria Snow", font: .systemFont(ofSize: 32, weight: .bold), textColor: .black, textAlignment: .left, numberOfLines: 0)
        return l
    }()
    
    fileprivate let infoLabel: UILabel = {
        let l = UILabel(text: "San Francisco, CA \nUNC \n20 years", font: .systemFont(ofSize: 16, weight: .regular), textColor: .darkGray, textAlignment: .left, numberOfLines: 0)
        return l
    }()
    
    fileprivate let majorsLabel: UILabel = {
        let l = UILabel(text: "Majors: \n- Anthropology \n- Computer Science", font: .systemFont(ofSize: 16, weight: .regular), textColor: .darkGray, textAlignment: .left, numberOfLines: 0)
        return l
    }()
    
    fileprivate let myInterestsLabel: UILabel = {
        let l = UILabel(text: "My Interests", font: .systemFont(ofSize: 26, weight: .medium), textColor: .black, textAlignment: .left, numberOfLines: 1)
        return l
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
        profilePhotoBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        profilePhotoBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        profilePhotoBackgroundView.widthAnchor.constraint(equalTo: profilePhotoBackgroundView.heightAnchor).isActive = true
        profilePhotoBackgroundView.centerXToSuperview()
        
        view.addSubview(profilePhotoImageView)
        profilePhotoImageView.topAnchor.constraint(equalTo: profilePhotoBackgroundView.topAnchor).isActive = true
        profilePhotoImageView.heightAnchor.constraint(equalTo: profilePhotoBackgroundView.heightAnchor).isActive = true
        profilePhotoImageView.widthAnchor.constraint(equalTo: profilePhotoBackgroundView.widthAnchor).isActive = true
        profilePhotoImageView.centerXToSuperview()
        
        view.addSubview(bottomView)
        bottomView.anchor(top: profilePhotoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0))
        
        view.addSubview(penButton)
        penButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 18), size: .init(width: 25, height: 25))
        
        bottomView.addSubview(nameLabel)
        nameLabel.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: penButton.leadingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 16))
        
        bottomView.addSubview(infoLabel)
        infoLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: bottomView.centerXAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 4))
        
        bottomView.addSubview(majorsLabel)
        majorsLabel.anchor(top: infoLabel.topAnchor, leading: bottomView.centerXAnchor, bottom: nil, trailing: bottomView.trailingAnchor, padding: .init(top: 0, left: 4, bottom: 0, right: 24))
        
        bottomView.addSubview(myInterestsLabel)
        myInterestsLabel.anchor(top: infoLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
    }
}
