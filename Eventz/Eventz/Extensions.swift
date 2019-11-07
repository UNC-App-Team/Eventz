//
//  Extensions.swift
//  Eventz
//
//  Created by Max Nabokow on 11/7/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import Foundation
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

