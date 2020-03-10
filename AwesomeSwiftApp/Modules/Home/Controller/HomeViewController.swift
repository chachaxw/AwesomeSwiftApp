//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/4.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView.dataSource = self as? UICollectionViewDataSource
        collectionView.delegate = self as? UICollectionViewDelegate
    }
}
