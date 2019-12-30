//
//  Injection.swift
//  Eventz
//
//  Created by Max Nabokow on 12/30/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

extension UIViewController {
    
    #if DEBUG
    @objc func injected() {
        
        for subview in self.view.subviews {
            
            for subsubview in subview.subviews {
                
                for subsubsubview in subsubview.subviews {
                    subsubsubview.removeFromSuperview()
                }
                
                subsubview.removeFromSuperview()
            }
            
            subview.removeFromSuperview()
        }
        
        if let sublayers = self.view.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
        
        viewDidLoad()
    }
    #endif
}
