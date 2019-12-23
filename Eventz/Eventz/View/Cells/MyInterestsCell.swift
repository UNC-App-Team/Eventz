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
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "law"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    fileprivate let label: UILabel = {
        let l = UILabel(text: "Computer Science", font: .systemFont(ofSize: 14, weight: .regular), textColor: .black, textAlignment: .center, numberOfLines: 0)
        return l
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    func configure(image: UIImage, title: String) {
        imageView.image = image
        label.text = title
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 12
        setupShadow(opacity: 0.3, radius: 3, offset: .init(width: 3, height: 3), color: .black)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }
    
    fileprivate func setupLayout() {
        addSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.centerXToSuperview()
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16).isActive = true
        
        addSubview(label)
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        label.centerXToSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
