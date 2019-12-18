//
//  Extensions.swift
//  Eventz
//
//  Created by Max Nabokow on 11/7/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addLeftInset(insetValue: Int = 10, height: Int) {
        let leftView = UIView(frame: .init(x: 0, y: 0, width: insetValue, height: height))
        leftView.backgroundColor = self.backgroundColor
        self.leftView = leftView
        self.leftViewMode = .always
        clipsToBounds = true
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

