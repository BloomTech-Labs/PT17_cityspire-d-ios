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

//struct Pollution: Codable {
//    let AQUI_index: Int
//    let description: PollutionDescription
//}
//
//struct PollutionDescription: Codable {
//    let Health_Implecations: String
//    let Cauutinary_statement_PM2 : String?
//}
