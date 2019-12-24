//
//  Extensions.swift
//  Eventz
//
//  Created by Max Nabokow on 11/7/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import JGProgressHUD

extension UITextField {
    
    func addLeftInset(insetValue: Int = 10, height: Int) {
        let leftView = UIView(frame: .init(x: 0, y: 0, width: insetValue, height: height))
        leftView.backgroundColor = self.backgroundColor
        self.leftView = leftView
        self.leftViewMode = .always
        clipsToBounds = true
    }
    
}

extension UILabel {

    func adjustFontSizeToFit() {
        if numberOfLines == 0 {
            lineBreakMode = .byWordWrapping
            let maximumLabelSize = CGSize(width: superview!.frame.width, height: superview!.frame.height)
            let expectSize = sizeThatFits(maximumLabelSize)
            widthAnchor.constraint(equalToConstant: expectSize.width).isActive = true
            heightAnchor.constraint(equalToConstant: expectSize.height).isActive = true
        } else if numberOfLines == 1 {
            adjustsFontSizeToFitWidth = true
        }
    }
    
    func shrinkFontToFit() {
        lineBreakMode = .byWordWrapping
        let minFontSize: CGFloat = 10
        let maxFontSize = font.pointSize
        
        for size in stride(from: maxFontSize, to: minFontSize, by: -CGFloat(0.1)) {
            let currentText = NSString(string: text ?? "Unknows")
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: superview!.frame.width, height: superview!.frame.width)
            
            let labelSize = currentText.boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: proposedFont], context: nil)
            
            if labelSize.size.width < superview!.frame.width {
                font = proposedFont
                print("Set font size for \(text ?? "") to \(font.pointSize)")
                setNeedsLayout()
                break
            }
        }
    }
}

extension UIColor {
    
    static var carolinaBlue = #colorLiteral(red: 0.2941176471, green: 0.6117647059, blue: 0.8274509804, alpha: 1)
}


extension UIViewController {
    
    func roundCorners() {
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
    }
    
}

extension JGProgressHUD {
    
    convenience init(style: JGProgressHUDStyle, text: String) {
        self.init(style: style)
        textLabel.text = text
    }
}

