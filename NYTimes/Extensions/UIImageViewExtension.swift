//
//  UIImageViewExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    /**
     imageFromUrl method is used to download images and cache it in NSCache
     - Parameter urlString: url of the image to download
     */
    func imageFromUrl(_ urlString: String) {
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, _) in
            if let unwrappedData = data,
               let downloadedImage = UIImage(data: unwrappedData) {
                DispatchQueue.main.async(execute: {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                })
            }
        }
        dataTask.resume()
        
    }
}
