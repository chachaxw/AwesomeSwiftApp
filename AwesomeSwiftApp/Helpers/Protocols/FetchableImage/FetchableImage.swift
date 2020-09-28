//
//  FetchableImage.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/27.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct FetchableImageOptions {
    var storeInCachesDirectory: Bool = true
    var allowLocalStorage: Bool = true
    var customFileName: String?
}

protocol FetchableImage {
    func localFileURL(for imageURL: String?, options: FetchableImageOptions) -> URL?

    func fetchImage(
        from urlString: String?,
        options: FetchableImageOptions?,
        completion: @escaping (_ imageData: Data?) -> Void
    )

    func fetchBatchImages(
        using urlStrings: [String?],
        options: FetchableImageOptions?,
        partialFetchHandler: @escaping (_ imageData: Data, _ index: Int) -> Void,
        completion: @escaping () -> Void
    )

    func deleteImage(using imageURL: String?, options: FetchableImageOptions?) -> Bool

    func deleteBatchImages(using imageURLd: [String?], options: FetchableImageOptions?)

    func deleteBatchImages(using multipleOptions: [FetchableImageOptions])

    func save(image data: Data, options: FetchableImageOptions) -> Bool
}

extension FetchableImage {
    /// Get local file URL for imageURL
    /// - Parameters:
    ///     - imageURL: The image url string
    ///     - options: The fetchable image options
    /// - Returns: A URL
    func localFileURL(for imageURL: String?, options: FetchableImageOptions? = nil) -> URL? {
        let opt = FetchableImageHelper.getOptions(options)
        let targetDir = opt.storeInCachesDirectory ?
            FetchableImageHelper.cachesDirectoryURL :
            FetchableImageHelper.documentsDirectoryURL
        
        guard let urlString = imageURL else {
            guard let customFileName = opt.customFileName else { return nil }
            return targetDir.appendingPathComponent(customFileName)
        }
        
        guard let imageName = FetchableImageHelper.getImageName(from: urlString) else { return nil }
        return targetDir.appendingPathExtension(imageName)
    }
    
    /// Fetch image from url string
    /// - Parameters:
    ///     - urlString: The url string
    ///     - options: The fetchable image options
    ///     - completion: An block called once the fetching did finish.
    func fetchImage(from urlString: String?, options: FetchableImageOptions? = nil, completion: @escaping (_ imageData: Data?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let opt = FetchableImageHelper.getOptions(options)
            let localURL = self.localFileURL(for: urlString, options: options)
            
            // Determine if image exists locally first.
            if opt.allowLocalStorage, let localURL = localURL, FileManager.default.fileExists(atPath: localURL.path) {
                // Image exists locally!
                // Load it using the composed localURL.
                let loadedImageData = FetchableImageHelper.loadLocalImage(from: localURL)
                completion(loadedImageData)
            } else {
                // Image does not exist locally!
                // Download it.
                guard let urlString = urlString, let url = URL(string: urlString) else {
                    completion(nil)
                    return
                }
                
                FetchableImageHelper.downloadImage(from: url) { (imageData) in
                    if opt.allowLocalStorage, let localURL = localURL {
                        try? imageData?.write(to: localURL)
                    }
                    
                    completion(imageData)
                }
            }
        }
    }
    
    /// Fetch batch iimages from url string array
    /// - Parameters:
    ///     - urlStrings: The url string array
    ///     - options: The fetchable image options
    ///     - partialFetchHandler: An handle block function
    ///     - completion: An block called once the batch fetching did finish.
    func fetchBatchImages(
        using urlStrings: [String],
        options: FetchableImageOptions? = nil,
        partialFetchHandler: @escaping (_ imageData: Data?, _ index: Int) -> Void,
        completion: @escaping () -> Void
    ) {
        performBatchImageFetching(using: urlStrings, currentImageIndex: 0, options: options, partialFetchHandler: { (imageData, index) in
            partialFetchHandler(imageData, index)
        }) {
            completion()
        }
    }
    
    private func performBatchImageFetching(
        using urlStrings: [String?],
        currentImageIndex: Int,
        options: FetchableImageOptions?,
        partialFetchHandler: @escaping (_ imageData: Data?, _ index: Int) -> Void,
        completion: @escaping () -> Void
    ) -> Void {
        guard currentImageIndex < urlStrings.count else {
            completion()
            return
        }
        
        fetchImage(from: urlStrings[currentImageIndex], options: options) { (imageData) in
            partialFetchHandler(imageData, currentImageIndex)
            
            self.performBatchImageFetching(
                using: urlStrings,
                currentImageIndex: currentImageIndex + 1,
                options: options,
                partialFetchHandler: partialFetchHandler
            ) {
                completion()
            }
        }
    }
    
    /// Remove image from local
    /// - Parameters:
    ///     - imageURL: The image url string
    ///     - options: The fetchable image options
    /// - Returns: if the image is deleted
    func deleteImage(using imageURL: String?, options: FetchableImageOptions? = nil) -> Bool {
        guard let localURL = localFileURL(for: imageURL, options: options) else { return false }
        
        do {
            try FileManager.default.removeItem(at: localURL)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    /// Remove batch images from local
    /// - Parameters:
    ///     - imageURsL: The image url string array
    ///     - options: The fetchable image options
    func deleteBatchImages(using imageURLs: [String?], options: FetchableImageOptions? = nil) {
        DispatchQueue.global().async {
            imageURLs.forEach { _ = self.deleteImage(using: $0, options: options) }
        }
    }
    
    /// Remove batch images from local
    /// - Parameters:
    ///     - multipleOptions: The fetchable image options
    func deleteBatchImages(using multipleOptions: [FetchableImageOptions]) {
        DispatchQueue.global().async {
            multipleOptions.forEach { _ = self.deleteImage(using: nil, options: $0) }
        }
    }

    /// Save image data to local
    /// - Parameters:
    ///     - data: The image url string array
    ///     - options: The fetchable image options
    /// - Returns: if the data is saved
    func save(image data: Data, options: FetchableImageOptions) -> Bool {
        guard let url = localFileURL(for: nil, options: options) else { return false }
        
        do {
            try data.write(to: url)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
