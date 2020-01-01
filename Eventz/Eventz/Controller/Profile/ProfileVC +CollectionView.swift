//
//  ProfileVC +CollectionView.swift
//  Eventz
//
//  Created by Max Nabokow on 12/23/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestsCollectionView.interests.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = interestsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MyInterestsCell else { return UICollectionViewCell()}

        cell.configure(colors: interestsCollectionView.interests[indexPath.row].colors, title: interestsCollectionView.interests[indexPath.row].title)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let widthMarginsAndInsets = interestsCollectionView.inset * 2 + interestsCollectionView.safeAreaInsets.left + interestsCollectionView.safeAreaInsets.right + interestsCollectionView.minimumInteritemSpacing * CGFloat(interestsCollectionView.cellsPerRow - 1)
//        let itemWidth = ((collectionView.bounds.size.width - widthMarginsAndInsets) / CGFloat(interestsCollectionView.cellsPerRow)).rounded(.down)
//        let heightMarginsAndInsets = interestsCollectionView.inset * 2 + interestsCollectionView.safeAreaInsets.top + interestsCollectionView.safeAreaInsets.bottom + interestsCollectionView.minimumInteritemSpacing
//        let itemHeight = (collectionView.bounds.size.height - heightMarginsAndInsets) / CGFloat(2).rounded(.down)
//        return CGSize(width: itemWidth, height: itemHeight)

        let height = interestsCollectionView.bounds.height - interestsCollectionView.inset * 2
        return .init(width: height, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 24, bottom: 0, right: 24)
    }
}
