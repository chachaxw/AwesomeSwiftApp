//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/4.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

let cellIdentifiier = "CardCell"

class HomeViewController: UIViewController {
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.Theme.LightGrayColor
        collectionView.backgroundColor = UIColor.white

        if #available(iOS 11, *) {
            navigationBar.prefersLargeTitles = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifiier, for: indexPath) as? CollectionViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }

        cell.setCardView()
        cell.setLabelText(label: "Hello Chacha")
        cell.setTitleText(title: "The Best Swift Demo")
        cell.setCoverImage(imgUrl: "http://00.minipic.eastday.com/20170420/20170420105628_ea6da92abc46098d8e03ad2ee55abeb7_9.jpeg")

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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 28, height: 188)
    }
}
