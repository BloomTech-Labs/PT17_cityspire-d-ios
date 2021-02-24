//
//  NetworkModels.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

/// Information to display a city's walkability score
struct Walkability: Codable {
    let walk_score: Int
    let walk_message: String
    let transit_score: Int?
    let bike_score: Int
}

/// Information to display properties for rent
struct ForRent: Codable {
    let address: Address
    let community: Community
}

/// Information for max price
struct Community: Codable {
    let price_max: Int
}

/// Information to display properties for sale
struct ForSale: Codable {
    let address: Address
    let price: Double
}

/// Information to get a specific address
struct Address: Codable {
    let line: String?
    let lat: Double
    let lon: Double
}
