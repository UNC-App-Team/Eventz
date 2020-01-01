//
//  AccountView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/29/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class AccountView: UIView {
    
    // MARK: - UI Elements
    
    fileprivate let profileImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "girl 2"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        return iv
    }()
    
    fileprivate let profileImageBackground: UIView = {
        let v = UIView(backgroundColor: .white)
        v.setupShadow(opacity: 0.25, radius: 6, offset: .init(width: 3, height: 3), color: .black)
        return v
    }()
    
    fileprivate let nameLabel: UILabel = {
        let l = UILabel()
        l.text = "Maria Snow"
        l.textColor = .white
        l.font = .systemFont(ofSize: 32, weight: .heavy)
        l.textAlignment = .left
        l.adjustsFontSizeToFitWidth = true
        l.numberOfLines = 1
        return l
    }()
    
    fileprivate let emailLabel: UILabel = {
        let l = UILabel()
        l.text = "msnow21@live.unc.edu"
        l.textColor = .white
        l.font = .systemFont(ofSize: 18, weight: .regular)
        l.adjustsFontSizeToFitWidth = true
        l.numberOfLines = 1
        return l
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    fileprivate func configure(user: User) {
        
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(profileImageBackground)
        profileImageBackground.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 16, left: 0, bottom: 16, right: 0))
        profileImageBackground.widthAnchor.constraint(equalTo: profileImageBackground.heightAnchor).isActive = true
        profileImageBackground.layer.cornerRadius = frame.height / 2
        
        profileImageBackground.addSubview(profileImageView)
        profileImageView.fillSuperview()
        profileImageView.layer.cornerRadius = frame.height / 2
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: profileImageBackground.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        stackView.centerYAnchor.constraint(equalTo: profileImageBackground.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
