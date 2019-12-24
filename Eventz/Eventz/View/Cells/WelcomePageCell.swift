//
//  WelcomePageCell.swift
//  Eventz
//
//  Created by Max Nabokow on 12/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

protocol WelcomePageCellDelegate {
    
    func handleGetStarted()
    
}

class WelcomePageCell: UICollectionViewCell {
    
    // MARK: - UI Elements
        
    fileprivate let titleLabel: UILabel = {
        let labelText = NSMutableAttributedString()
        let firstString = NSMutableAttributedString(string: "Welcome to\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        let secondString = NSMutableAttributedString(string: "Eventz", attributes: [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 72, weight: .heavy),
        NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let l = UILabel()
        labelText.append(firstString)
        labelText.append(secondString)
        
        l.attributedText = labelText
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    fileprivate let iconView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "oldWellIcon"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    fileprivate let textView: UILabel = {
        let tv = UILabel()
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.font = .systemFont(ofSize: 16, weight: .semibold)
        tv.text = "The best way to navigate UNC\nand discover new places."
        tv.numberOfLines = 2
        tv.textAlignment = .center
        return tv
    }()
    
    fileprivate let getStartedButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = .systemOrange
        b.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        b.setTitle("Get Started", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        
        return b
    }()
    
    var delegate: WelcomePageCellDelegate?

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        
        getStartedButton.addTarget(self, action: #selector(handleGetStarted), for: .touchUpInside)
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
        
        topContainerView.addSubview(titleLabel)
        titleLabel.fillSuperview()
        
        let bottomContainerView = UIStackView(arrangedSubviews: [iconView, textView])
        bottomContainerView.axis = .vertical
        
        iconView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        bottomContainerView.distribution = .fillProportionally
        bottomContainerView.spacing = 8
        addSubview(bottomContainerView)
        
        bottomContainerView.anchor(top: topContainerView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        bottomContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        addSubview(getStartedButton)
        getStartedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        getStartedButton.anchor(top: bottomContainerView.bottomAnchor, leading: nil, bottom: nil, trailing: nil)
        getStartedButton.centerXToSuperview()
    }
    
    @objc func handleGetStarted() {
        print("Ya")
        delegate?.handleGetStarted()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
