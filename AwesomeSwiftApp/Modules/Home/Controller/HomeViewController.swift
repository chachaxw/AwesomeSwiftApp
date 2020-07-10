//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/4.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = UIColor.Theme.LightGrayColor

        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CardCell", for: indexPath) as? CollectionViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}
