//
//  CustomTextField.swift
//  Eventz
//
//  Created by Max Nabokow on 12/22/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    var padding: CGFloat
    
    
    init(placeholder: String, textColor: UIColor = .label, placeholderColor: UIColor = .placeholderText, placeholderFont: UIFont = .systemFont(ofSize: 18, weight: .regular), padding: CGFloat = 16) {
        self.padding = padding
        super.init(frame: .zero)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor, NSAttributedString.Key.font : placeholderFont])
        backgroundColor = .white
        self.textColor = textColor
        layer.cornerRadius = 25
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 50)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
