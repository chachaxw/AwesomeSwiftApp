//
//  FetchableImageHelper.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/27.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct FetchableImageHelper {
    static var documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static var cachesDirectoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    
    static func getOptions(_ options: FetchableImageOptions?) -> FetchableImageOptions {
        return options != nil ? options! : FetchableImageOptions()
    }
    
    static func getImageName(from urlString: String) -> String? {
        guard var base64String = urlString.data(using: .utf8)?.base64EncodedString() else {
            return nil
        }

        base64String = base64String.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()

        guard base64String.count < 50 else {
            return String(base64String.dropFirst(base64String.count - 50))
        }

        return base64String
    }
    
    static func downloadImage(from url: URL, completion: @escaping (_ imageData: Data?) -> Void) {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url) { data, response, error in
            completion(data)
        }

        task.resume()
    }

    static func loadLocalImage(from url: URL) -> Data? {
        do {
            let imageData = try Data(contentsOf: url)
            return imageData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
