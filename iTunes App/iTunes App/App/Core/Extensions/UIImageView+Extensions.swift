//
//  UIImageView+Extensions.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 29.12.2022.
//

import UIKit

public let cache = NSCache<AnyObject, UIImage>() // Cache is used to avoid downloading images from repeatedly. This gains low internet usage, low server traffic but uses memory a little bit more.

extension UIImageView {
    
    /// Sends a request with the url of the image which wanted to be downloaded.
    /// Uses NSCache and first checks if the image is already in cache. If it's not, downloads it and creates that object in Cache
    /// - Parameters:
    /// - url: url of the image that wanted to be downloaded.
    func downloadImage(url: URL?) {
        guard let url = url else { return }
        
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            self.image = image
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let data = data,
                  let image = UIImage(data: data) else { return } // Create the image with data
            DispatchQueue.main.async {
                self.image = image
            }
            cache.setObject(image, forKey: url.absoluteString as NSString) // set the downloaded image as new object.
        }
        dataTask.resume()
    }
}
