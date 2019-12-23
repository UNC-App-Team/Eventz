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
    
    let interests: [(image: UIImage, title: String)] = [
        (UIImage(named: "money")!, "Finance"),
        (UIImage(named: "interestImage")!, "Computer Science"),
        (UIImage(named: "law")!, "Law"),
        (UIImage(named: "running")!, "Running")
    ]
    
    let inset: CGFloat = 6
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
