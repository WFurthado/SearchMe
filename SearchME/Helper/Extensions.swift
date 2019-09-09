//
//  Extensions.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageURLString: String?
    
    func loadImageUsingURLString(urlString: String) {
        
        imageURLString = urlString
        
        let url = URL(string: urlString)
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache//UIImage(data: data!)
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: {
                let imageToCache = UIImage(data: data!)
                
                if self.imageURLString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            })
            }.resume()
    }
}
