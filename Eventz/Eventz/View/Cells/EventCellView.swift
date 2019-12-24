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
    fileprivate let backgroundOverlay1: CAGradientLayer = {
        let l = CAGradientLayer()
        l.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        l.locations = [0.0, 1.0]
        l.startPoint = CGPoint(x: 0.0, y: 0.5)
        l.endPoint = CGPoint(x: 0.5, y: 0.5)
       return l
    }()
    
    fileprivate let backgroundOverlay2: CAGradientLayer = {
        let l = CAGradientLayer()
        l.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        l.locations = [0.0, 1.0]
        l.startPoint = CGPoint(x: 0.5, y: 1)
        l.endPoint = CGPoint(x: 0.5, y: 0.5)
       return l
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
    
    fileprivate let calendarIcon: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysOriginal), contentMode: .scaleAspectFit)
        return iv
    }()
    
    fileprivate let dateLabel: UILabel = {
        let l = UILabel(text: "Today, 2 pm", font: .systemFont(ofSize: 14, weight: .semibold), textColor: .white, textAlignment: .left, numberOfLines: 1)
        return l
    }()
    
    fileprivate let pinIcon: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "pin").withRenderingMode(.alwaysOriginal), contentMode: .scaleAspectFit)
        return iv
    }()
    
    fileprivate let locationLabel: UILabel = {
        let l = UILabel(text: "Wilson Library", font: .systemFont(ofSize: 14, weight: .semibold), textColor: .white, textAlignment: .left, numberOfLines: 1)
        return l
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    func configure(event: Event) {
        
        backgroundImage.image = UIImage(named: event.imageURL ?? "")
        // backgroundImage.image = #imageLiteral(resourceName: "concert")
        titleLabel.text = event.title
        categoryLabel.text = event.category
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundOverlay1.frame = bounds
        layer.insertSublayer(backgroundOverlay1, at: 1)
        backgroundOverlay2.frame = bounds
        layer.insertSublayer(backgroundOverlay2, at: 1)
    }
    
    fileprivate func setupLayout() {
        
        addSubview(backgroundImage)
        backgroundImage.fillSuperview(padding: .init(top: 0, left: frame.width, bottom: 0, right: 0))

        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 18, bottom: 0, right: 0))
        
        addSubview(categoryLabel)
        categoryLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        
        addSubview(calendarIcon)
        calendarIcon.anchor(top: nil, leading: titleLabel.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 18, right: 0), size: .init(width: 30, height: 30))
        
        addSubview(dateLabel)
        dateLabel.anchor(top: calendarIcon.topAnchor, leading: calendarIcon.trailingAnchor, bottom: calendarIcon.bottomAnchor, trailing: centerXAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 24))
        
        addSubview(pinIcon)
        pinIcon.anchor(top: nil, leading: centerXAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 18, right: 0), size: .init(width: 30, height: 30))
        
        addSubview(locationLabel)
        locationLabel.anchor(top: pinIcon.topAnchor, leading: pinIcon.trailingAnchor, bottom: pinIcon.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 18))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
