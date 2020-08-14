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
    var cardList: [CardItem] = [
        CardItem(
            id: UUID().uuidString,
            label: "Hello World",
            title: "Hello, awesome swift App",
            imgUrl: "",
            isLiked: true
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Hello Chacha",
            title: "The Best Swift Demo",
            imgUrl: "",
            isLiked: false
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Hello Swift",
            title: "The Best Swift Demo",
            imgUrl: "",
            isLiked: true
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Hello Javascript",
            title: "The Best Swift Demo",
            imgUrl: "",
            isLiked: false
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Hello iOS",
            title: "The Best Swift Demo",
            imgUrl: "",
            isLiked: true
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.Theme.LightGrayColor
        collectionView.backgroundColor = UIColor.white
        collectionView.roundCorners(corners: [UIRectCorner.topLeft, UIRectCorner.topRight], with: 16.0)

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

        let cardItem: CardItem = cardList[indexPath[1]]
        cell.setLabelText(label: cardItem.label)
        cell.setTitleText(title: cardItem.title)
        cell.setCoverImage(imgUrl: cardItem.imgUrl)
        cell.setCardView()

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
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
