//
//  MyInterestsCollectionView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/23/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

protocol MyInterestsCollectionViewDelegate {
    
    func handleInterestTapped()
    
}

class MyInterestsCollectionView: UICollectionView {
    
    let interests: [(colors: (UIColor, UIColor), title: String)] = [
        ((.systemTeal, .systemBlue), "Science"),
        ((.systemRed, .systemYellow), "Visual Arts"),
        ((.systemPink, .systemPurple), "Food"),
        ((.systemBlue, .systemTeal), "Sports"),
        ((.systemYellow, .systemRed), "Social Justice"),
        ((.systemPurple, .systemPink), "Music")
    ]
    
    let inset: CGFloat = 6
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        
        // not necessary, but just in case
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
