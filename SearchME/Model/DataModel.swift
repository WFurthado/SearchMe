//
//  DataModel.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import Foundation

struct ResponseObject: Decodable {
    let code: Int?
    let status: String?
    let data: Products?
}

struct Products: Decodable {
    let products: [Product]?
}

struct Product: Decodable {
    let name: String?
    let status: String?
    let price: Price?
    let review: Review?
    let promoBadgeUrl: String?
    let images: [String]?
}

struct Price: Decodable {
    let priceDisplay: String?
    let strikeThroughPriceDisplay: String?
    let discount: Int?
    let minPrice: Int?
}

struct Review: Decodable {
    let rating: Int?
    let count: Int?
}

