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
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var avatarView: UIImageView!
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var navigationBar: UINavigationBar!
    var cardList: [CardItem] = [
        CardItem(
            id: UUID().uuidString,
            label: "Swift Demo",
            title: "Hello, awesome swift App",
            isLiked: true,
            uiImage: R.image.image1()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "The Best Swift Demo",
            isLiked: false,
            uiImage: R.image.image2()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "The Best Swift Demo",
            isLiked: true,
            uiImage: R.image.image3()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "The Best Swift Demo",
            isLiked: false,
            uiImage: R.image.image4()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "The Best Swift Demo",
            isLiked: true,
            uiImage: R.image.image5()
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.Theme.LightGrayColor

        if #available(iOS 11, *) {
            navigationBar.prefersLargeTitles = true
        }

        initCollectionView()
        initAvatarView()
    }

    func initCollectionView() {
        contentView.backgroundColor = UIColor.white
        contentView.roundCorners(corners: [UIRectCorner.topLeft, UIRectCorner.topRight], with: 20.0)
    }

    func initAvatarView() {
        let bounds = avatarView.bounds
        avatarView.roundCorners(corners: UIRectCorner.allCorners, with: bounds.width)
        avatarView.backgroundColor = UIColor.white
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
        cell.setCoverImage(image: cardItem.uiImage!)
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
        let width = UIScreen.main.bounds.width - 14 * 2
        print("屏幕宽度数据 \(width)")

        return CGSize(width: width, height: 188)
    }
}
