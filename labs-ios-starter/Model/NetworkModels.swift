//
//  NetworkModels.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Walkability: Codable {
    let walk_score: Int
    let walk_message: String
    let transit_score: Int?
    let bike_score: Int
}

struct Livability: Codable {
    let AQI_index: Int
    let description: LivabilityJSONObject
    
}

struct LivabilityJSONObject: Codable {
    let healthImplecations: String
    let cautinaryStatement: String
    
    enum CodingKeys: String, CodingKey {
        case healthImplecations = "Health_Implecations"
        case cautinaryStatement = "Cautinary_statement_PM2.5"
    }
}
