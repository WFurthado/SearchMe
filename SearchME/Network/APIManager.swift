//
//  APIManager.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import Foundation
import UIKit

class APIManager: NSObject {
    
    func getProductDetails(urlString: String, completion: @escaping (ResponseObject?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Error unwrapping URL"); return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else { print("Error getting data"); return }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseObject.self, from: data!)
                print(responseObject.data)
                completion(responseObject)
            } catch {
                completion(nil)
                print("Error getting API data: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }

}
