//
//  ProductInfoViewModel.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import Foundation
import UIKit

class ProductInfoViewModel: NSObject {
    
    var apiClient = APIManager()
    
    var responseObject: ResponseObject?
    
    var productInfoArray = [Product]()
    
    var pageNumber = 0
    
    var i = 0
    
    func getProductDetails(searchString: String, completion: @escaping (ResponseObject?) -> Void) {
        
        let urlStr = generateURLString(pageNumber: pageNumber, searchString: searchString)
        
        apiClient.getProductDetails(urlString: urlStr) { (responseObj) in
            if let responseObject = responseObj {
                if let productArrayObj: Products = responseObject.data {
                    if let productArr = productArrayObj.products {
                        self.productInfoArray.append(contentsOf: productArr)
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }
    }
    
    func generateURLString(pageNumber: Int, searchString: String) -> String {
        
        var urlString = "https://www.blibli.com/backend/search/products?searchTerm=" + searchString + "&start="
        
        let startInd: Int = pageNumber == 0 ? 0 : 1;
        let startIndex: String = String((pageNumber * 24) + (startInd * 1))
        urlString.append(startIndex)
        
        urlString.append("&itemPerPage=")

        let endIndex: String = String((pageNumber + 1) * (24))
        urlString.append(endIndex)

        print("\(urlString)")
        
        return urlString
    }

}
