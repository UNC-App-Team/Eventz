//
//  WelcomeVC +CollectionView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/15/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

extension WelcomeViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "welcomePageCell", for: indexPath) as? WelcomePageCell else { return UICollectionViewCell()}
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let newPage = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = newPage
        
        if pageControl.currentPage == pages.count - 1 {
            nextButton.setTitle("", for: .normal)
            nextButton.isEnabled = false
        } else {
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.isEnabled = true
        }
    }
    
    // Account for landscape mode rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }, completion: nil)
    }
}
