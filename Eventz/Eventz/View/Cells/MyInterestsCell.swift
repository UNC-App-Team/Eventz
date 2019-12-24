//
//  MyInterestsCell.swift
//  Eventz
//
//  Created by Max Nabokow on 12/23/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import ColorThiefSwift

class MyInterestsCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    fileprivate let backgroundGradient: CAGradientLayer = {
        let l = CAGradientLayer()
        l.locations = [0.0, 1.0]
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        l.colors = [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor]
        return l
    }()
    
    // makes the background image darker, and text more legible
    fileprivate lazy var backgroundOverlay: UIView = {
        let v = UIView(backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2991224315))
        return v
    }()
    
    fileprivate let label: AKLabel = {
        let l = AKLabel(text: "Computer Science", font: .systemFont(ofSize: 18, weight: .regular), textColor: .white, textAlignment: .center, numberOfLines: 0)
        return l
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    func configure(colors: (UIColor, UIColor), title: String) {
        backgroundGradient.colors = [colors.0.cgColor, colors.1.cgColor]
        backgroundGradient.frame = bounds
        layer.insertSublayer(backgroundGradient, at: 1)
        label.text = title
        setupShadow(opacity: 0.5, radius: 3, offset: .init(width: 3, height: 3), color: colors.0)
    }
    
    // MARK: - UI Setup

    fileprivate func setupUI() {
        backgroundColor = .clear
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    fileprivate func setupLayout() {
        addSubview(backgroundOverlay)
        backgroundOverlay.fillSuperview()
        
        addSubview(label)
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        label.centerInSuperview()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
