//
//  ImageLoader.swift
//  Reddit
//
//  Created by Nikolay on 18.02.2021.
//

import UIKit

struct ImageLoader {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    static func loadImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = ImageLoader.imageCache.object(forKey: url.absoluteString as NSString)  {
            completion(cachedImage)
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil, let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            imageCache.setObject(image, forKey: url.absoluteString as NSString)
            completion(image)
        }).resume()
    }
}
