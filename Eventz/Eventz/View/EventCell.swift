//
//  EventCell.swift
//  Eventz
//
//  Created by Max Nabokow on 12/13/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    // MARK: - Properties
    fileprivate let eventCellView = EventCellView()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
    }
    
    func configure(event: Event) {
        eventCellView.configure(event: event)
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        
    }
    
    fileprivate func setupLayout() {
        contentView.addSubview(eventCellView)
        eventCellView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
