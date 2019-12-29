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
    
    fileprivate let nameLabel: UILabel = {
        let l = UILabel(text: "Maria Snow", font: .systemFont(ofSize: 32, weight: .bold), textColor: .black, textAlignment: .left, numberOfLines: 1)
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    fileprivate let emailLabel: UILabel = {
        let l = UILabel(text: "msnow21@live.unc.edu", font: .systemFont(ofSize: 18, weight: .regular), textColor: .darkGray, textAlignment: .left, numberOfLines: 1)
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    fileprivate lazy var HOMETOWNLabel: UILabel = {
        let l = makeLABEL(text: "Hometown")
        return l
    }()
    
    fileprivate lazy var hometownLabel: UILabel = {
        let l = makeLabel(text: "San Francisco, CA")
        return l
    }()
    
    fileprivate lazy var AGELabel: UILabel = {
        let l = makeLABEL(text: "Age")
        return l
    }()
    
    fileprivate lazy var ageLabel: UILabel = {
        let l = makeLabel(text: "20")
        return l
    }()
    
    fileprivate lazy var MAJORSLabel: UILabel = {
        let text = majorsLabels.count <= 1 ? "Major" : "Majors"
        let l = makeLABEL(text: text)
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    fileprivate lazy var majorsLabels: [UILabel] = {
        let labels = [makeLabel(text: "Computer Science")]
        return labels
    }()
    
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
        
//        interestsCollectionView.register(MyInterestsCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        interestsCollectionView.delegate = self
//        interestsCollectionView.dataSource = self
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .carolinaBlue
        roundCorners()
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(accountView)
        accountView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 48, left: 24, bottom: 24, right: 24))
        accountView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.165).isActive = true

        view.addSubview(bottomView)
        bottomView.anchor(top: accountView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 48, left: 0, bottom: (tabBarController?.tabBar.frame.height)!, right: 0))
//
//        view.addSubview(penButton)
//        penButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 18), size: .init(width: 25, height: 25))
//
//        bottomView.addSubview(nameLabel)
//        nameLabel.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: bottomView.trailingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 24))
//
//        bottomView.addSubview(emailLabel)
//        emailLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: bottomView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 24))
//
//        let hometownStackView = UIStackView(arrangedSubviews: [HOMETOWNLabel, hometownLabel])
//        hometownStackView.distribution = .fill
//        hometownStackView.spacing = 8
//        view.addSubview(hometownStackView)
//        hometownStackView.anchor(top: emailLabel.bottomAnchor, leading: emailLabel.leadingAnchor, bottom: nil, trailing: emailLabel.trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0))
//
//        let divider1 = UIView(backgroundColor: .darkGray)
//        view.addSubview(divider1)
//        divider1.anchor(top: hometownStackView.bottomAnchor, leading: hometownStackView.leadingAnchor, bottom: nil, trailing: hometownStackView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
//        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//
//        let ageStackView = UIStackView(arrangedSubviews: [AGELabel, ageLabel])
//        ageStackView.distribution = .fill
//        ageStackView.spacing = 8
//        view.addSubview(ageStackView)
//        ageStackView.anchor(top: divider1.bottomAnchor, leading: divider1.leadingAnchor, bottom: nil, trailing: divider1.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
//
//        let divider2 = UIView(backgroundColor: .darkGray)
//        view.addSubview(divider2)
//        divider2.anchor(top: ageStackView.bottomAnchor, leading: ageStackView.leadingAnchor, bottom: nil, trailing: ageStackView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
//        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//
//        let majorsStackView = UIStackView(arrangedSubviews: majorsLabels)
//        majorsStackView.axis = .vertical
//        majorsStackView.distribution = .fillEqually
//        majorsStackView.spacing = 2
//
//        let MAJORSStackView = UIStackView(arrangedSubviews: [MAJORSLabel, majorsStackView])
//        MAJORSStackView.distribution = .fill
//        MAJORSStackView.spacing = 8
//        view.addSubview(MAJORSStackView)
//        MAJORSStackView.anchor(top: divider2.bottomAnchor, leading: divider2.leadingAnchor, bottom: nil, trailing: divider2.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
//
//        bottomView.addSubview(myInterestsLabel)
//        myInterestsLabel.anchor(top: MAJORSStackView.bottomAnchor, leading: MAJORSStackView.leadingAnchor, bottom: nil, trailing: MAJORSStackView.trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0))
//        myInterestsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        bottomView.addSubview(interestsCollectionView)
//        interestsCollectionView.anchor(top: myInterestsLabel.bottomAnchor, leading: bottomView.leadingAnchor, bottom: bottomView.bottomAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 12, right: 0))
    }
}
