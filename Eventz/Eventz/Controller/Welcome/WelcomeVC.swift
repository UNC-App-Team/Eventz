//
//  WelcomeVC.swift
//  Eventz
//
//  Created by Max Nabokow on 12/14/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class WelcomeViewController: UICollectionViewController {
    
    // MARK: - UI Elements
    
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
    
    fileprivate let prevButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("BACK", for: .normal)
        b.setTitleColor(.lightGray, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        b.addTarget(self, action: #selector(handleControl), for: .touchUpInside)
        return b
    }()
    
    let nextButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("NEXT", for: .normal)
        b.setTitleColor(.systemOrange, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        b.addTarget(self, action: #selector(handleControl), for: .touchUpInside)
        return b
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .systemOrange
        pc.pageIndicatorTintColor = .lightGray
        return pc
    }()
    
    // MARK: - Properties
    
    let pages = [
        WelcomePage(),
        WelcomePage()
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        collectionView.register(WelcomePageCell.self, forCellWithReuseIdentifier: "welcomePageCell")
        roundCorners()
        setupLayout()
        setupBottomControls()
    }
    
    // MARK: - Selectors
    @objc func handleControl(button: UIButton) {
        var nextIndex: Int
        if button == nextButton {
            nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        } else {
            nextIndex = max(pageControl.currentPage - 1, 0)
        }
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if pageControl.currentPage == pages.count - 1 {
            nextButton.setTitle("", for: .normal)
            nextButton.isEnabled = false
        } else {
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.isEnabled = true
        }
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupLayout() {

        collectionView.backgroundView = backgroundImage
        collectionView.backgroundView?.addSubview(backgroundOverlay)
        backgroundOverlay.fillSuperview()
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomControlsStackView.backgroundColor = .systemPurple
    }
}

extension WelcomeViewController: WelcomePageCellDelegate {
    
    func handleGetStarted() {
        dismiss(animated: true, completion: nil)
    }

}
