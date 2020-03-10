//
//  CollectionViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/9.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var titleText: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var coverImgView: UIImageView!

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(
        collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CardCell", for: indexPath) as? CollectionViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }

        return cell
    }
}
