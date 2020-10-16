//
//  UserModel.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/28.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import UIKit

class UserModel: FetchableImage {
    var id: String
    var username: String
    var avatarUrl: String

    init(id: String, username: String, avatarUrl: String) {
        self.id = id
        self.username = username
        self.avatarUrl = avatarUrl
    }

    func fetchAvatar(avatarUrl: String, completion: @escaping (_ avatar: CGImage?) -> Void) {
        fetchImage(from: avatarUrl) { (imageData) in
            DispatchQueue.main.async {
                guard let data = imageData else { return }
                let cgImage = UIImage(data: data)?.cgImage
                completion(cgImage)
            }
        }
    }
}
