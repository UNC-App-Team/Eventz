//
//  WelcomePageCell.swift
//  Eventz
//
//  Created by Max Nabokow on 12/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class WelcomePageCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    
    
    fileprivate let welcomeLabel: UILabel = {
        let labelText = NSMutableAttributedString()
        let firstString = NSMutableAttributedString(string: "Welcome to\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        let secondString = NSMutableAttributedString(string: "Eventz", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 68, weight: .heavy),
        NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let l = UILabel()
        labelText.append(firstString)
        labelText.append(secondString)
        
        l.attributedText = labelText
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()

    fileprivate let prevButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("BACK", for: .normal)
        b.setTitleColor(.lightGray, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return b
    }()
    
    fileprivate let nextButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("NEXT", for: .normal)
        b.setTitleColor(.systemOrange, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return b
    }()
    
    fileprivate let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .systemOrange
        pc.pageIndicatorTintColor = .lightGray
        return pc
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        setupBottomControls()
    }
    
    // MARK: UI Setup
    
    fileprivate func setupUI() {
        clipsToBounds = true
    }
    
    fileprivate func setupLayout() {
        
        let topContainerView = UIView()
        addSubview(topContainerView)
        
        topContainerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        topContainerView.addSubview(welcomeLabel)
        welcomeLabel.fillSuperview()
    }
    
    fileprivate func setupBottomControls() {
           let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
           bottomControlsStackView.distribution = .fillEqually
           
           addSubview(bottomControlsStackView)
           bottomControlsStackView.anchor(top: nil, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor)
           bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
           bottomControlsStackView.backgroundColor = .systemPurple
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
