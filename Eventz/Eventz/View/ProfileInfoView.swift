//
//  ProfileInfoView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/31/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class ProfileInfoView: UIStackView {
    
    // MARK: - UI Elements
    
    fileprivate let keyLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 20, weight: .regular)
        l.textColor = .black
        l.textAlignment = .left
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    fileprivate let valuesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .trailing
        sv.spacing = 4
        return sv
    }()
    
    // MARK: - Init
    
    init(key: String, values: [String]) {
        super.init(frame: .zero)
        
        spacing = 16
        
        setKeyLabelText(key: key, values: values)
        addArrangedSubview(keyLabel)
        
        let valueLabelArray = values.map { (value) -> UILabel in
            let l = UILabel(text: value, font: .systemFont(ofSize: 20, weight: .bold), textColor: .black, textAlignment: .right, numberOfLines: 1)
            l.adjustsFontSizeToFitWidth = true
            return l
        }
        
        for label in valueLabelArray {
            valuesStackView.addArrangedSubview(label)
        }
        
        addArrangedSubview(valuesStackView)
    }
    
    fileprivate func setKeyLabelText(key: String, values: [String]) {
        if values.count > 1 {
            
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
