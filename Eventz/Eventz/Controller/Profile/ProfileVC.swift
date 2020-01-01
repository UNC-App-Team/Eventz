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
    
    fileprivate let accountView = AccountView()
    
    fileprivate let bottomView: UIView = {
        let v = UIView(backgroundColor: .white)
        v.layer.cornerRadius = 24
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.setupShadow(opacity: 0.8, radius: 4, offset: .init(width: 4, height: 4), color: .black)
        return v
    }()
    
    fileprivate let penButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        return b
    }()
    
    let homeTownView = ProfileInfoView(key: "Hometown", values: ["San Francisco, CA"])
    
    let graduationYearView = ProfileInfoView(key: "Graduation Year", values: ["2023"])
    
    let ageView = ProfileInfoView(key: "Age", values: ["20"])
    
    let majorsView = ProfileInfoView(key: "Majors", values: ["Computer Science"])
    
    let minorsView = ProfileInfoView(key: "Minors", values: ["Business"])
    

    fileprivate let myInterestsLabel: UILabel = {
        let l = UILabel(text: "My Interests", font: .systemFont(ofSize: 24, weight: .medium), textColor: .black, textAlignment: .left, numberOfLines: 1)
        return l
    }()

    let interestsCollectionView: MyInterestsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = MyInterestsCollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    // MARK: - Properties
    let cellIdentifier = "myInterestsCell"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        
        interestsCollectionView.register(MyInterestsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        interestsCollectionView.delegate = self
        interestsCollectionView.dataSource = self
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .carolinaBlue
        roundCorners()
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(accountView)
        accountView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 48, left: 24, bottom: 24, right: 24))
        accountView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true

        view.addSubview(bottomView)
        bottomView.anchor(top: accountView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 24, left: 0, bottom: (tabBarController?.tabBar.frame.height)!, right: 0))
        
        let infoStack = UIStackView(arrangedSubviews:
            [homeTownView,
            graduationYearView,
            ageView,
            majorsView,
            minorsView
        ])
        
        infoStack.axis = .vertical
        infoStack.spacing = 24
        
        view.addSubview(infoStack)
        infoStack.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: bottomView.trailingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 24))

        view.addSubview(penButton)
        penButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 18), size: .init(width: 25, height: 25))

        bottomView.addSubview(myInterestsLabel)
        myInterestsLabel.anchor(top: infoStack.bottomAnchor, leading: infoStack.leadingAnchor, bottom: nil, trailing: infoStack.trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0))
        myInterestsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        bottomView.addSubview(interestsCollectionView)
        interestsCollectionView.anchor(top: myInterestsLabel.bottomAnchor, leading: bottomView.leadingAnchor, bottom: bottomView.bottomAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 12, right: 0))
    }
}
