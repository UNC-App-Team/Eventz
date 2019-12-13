//
//  EventCellView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/13/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class EventCellView: UIView {
    
    // MARK: - Properties
    
    fileprivate let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Event Name"
        l.textColor = .white
        l.font = .systemFont(ofSize: 24, weight: .bold)
        l.numberOfLines = 0
        l.textAlignment = .left
        return l
    }()
    
    fileprivate let categoryLabel: UILabel = {
        let l = UILabel()
        l.text = "Category"
        l.textColor = .white
        l.font = .systemFont(ofSize: 16, weight: .medium)
        l.numberOfLines = 1
        l.textAlignment = .left
        return l
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    func configure(event: Event) {
        
        backgroundImage.image = UIImage(named: event.imageURL)
        titleLabel.text = event.title
        categoryLabel.text = event.description
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        backgroundColor = .systemGreen
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    fileprivate func setupLayout() {
        addSubview(backgroundImage)
        backgroundImage.fillSuperview()
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 18, bottom: 0, right: 0))
        
        addSubview(categoryLabel)
        categoryLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
