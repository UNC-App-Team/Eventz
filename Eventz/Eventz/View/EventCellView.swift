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
    
    // makes the background image darker, and text more legible
    fileprivate let backgroundOverlay: UIView = {
       let v = UIView(backgroundColor: .black)
       v.alpha = 0.1
       return v
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
        l.font = .systemFont(ofSize: 14, weight: .medium)
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
//        backgroundImage.image = #imageLiteral(resourceName: "concert")
        titleLabel.text = event.title
        print("Title is:", event.title)
        categoryLabel.text = event.category
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    fileprivate func setupLayout() {
        
        addSubview(backgroundImage)
        backgroundImage.fillSuperview(padding: .init(top: 0, left: frame.width, bottom: 0, right: 0))
        
        addSubview(backgroundOverlay)
        print(backgroundImage.frame.width)
        backgroundOverlay.fillSuperview(padding: .init(top: 0, left: frame.width, bottom: 0, right: 0))
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 18, bottom: 0, right: 0))
        
        addSubview(categoryLabel)
        categoryLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
