//
//  WelcomeVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class WelcomeViewController: UICollectionViewController {
    
    fileprivate let backgroundImage: UIImageView = {
        let v = UIImageView(image: #imageLiteral(resourceName: "concert"))
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    fileprivate let backgroundOverlay: UIView = {
        let v = UIView(backgroundColor: .black)
        v.alpha = 0.4
        return v
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        collectionView.register(WelcomePageCell.self, forCellWithReuseIdentifier: "welcomePageCell")
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {

        collectionView.backgroundView = backgroundImage
        collectionView.backgroundView?.addSubview(backgroundOverlay)
        backgroundOverlay.fillSuperview()
    }
}

extension WelcomeViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "welcomePageCell", for: indexPath) as? WelcomePageCell else { return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
