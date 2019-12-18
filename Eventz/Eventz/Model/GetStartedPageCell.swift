//
//  GetStartedPageCell.swift
//  Eventz
//
//  Created by Max Nabokow on 12/15/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GetStartedPageCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    fileprivate let getStartedButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = .systemOrange
        b.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        b.setTitle("Get Started", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        return b
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        
    }
    
    fileprivate func setupLayout() {
        addSubview(getStartedButton)
        getStartedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        getStartedButton.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
