//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/4.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Hero
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
            label: "Awesome Demo",
            title: "你好, Awesome demo App",
            isLiked: true,
            uiImage: R.image.image1()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "最佳Swift Demo",
            isLiked: false,
            uiImage: R.image.image2()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Best Practise",
            title: "Swift最佳实践",
            isLiked: true,
            uiImage: R.image.image3()
        ),
        CardItem(
            id: UUID().uuidString,
            label: "Featured",
            title: "Swift动效实战",
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
        print("Content View大小 \(contentView.frame.width)")
        contentView.setRoundCorners(corners: [UIRectCorner.topLeft, UIRectCorner.topRight], with: 20.0)
    }

    func initAvatarView() {
        let bounds = avatarView.bounds
        avatarView.setRoundCorners(corners: UIRectCorner.allCorners, with: bounds.width)
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

        cell.setCardView()
        cell.setLabelText(label: cardItem.label)
        cell.setTitleText(title: cardItem.title)
        cell.setCoverImage(image: cardItem.uiImage!)

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
//        let alertCtrl = UIAlertController(
//            title: "点击CollectionViewCell",
//            message: "当前indexPath \(indexPath.item)",
//            preferredStyle: .alert
//        )
//        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
//
//        alertCtrl.addAction(okAction)
//        self.present(alertCtrl, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

        cell?.hero.modifiers = [.scale(0.8)]
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = UIScreen.main.bounds.width - 14 * 2
        return CGSize(width: width, height: 188)
    }
}
