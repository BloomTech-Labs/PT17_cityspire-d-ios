//
//  NetworkClient.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

/// Handles logic for networking requests to retrieve specific information for a city
struct NetworkClient {
    // MARK: - Properties
    let api = "http://cityscape-203.eba-ijacxhm2.us-east-1.elasticbeanstalk.com/api/"
    
    /// Function to retrieve walkability score
    /// - Parameters:
    ///  - city: city to be entered to get specific score
    ///  - state: state to be entered to get specific score
    ///  - completion: Closure that will be called when the request is complete
    func getWalkability(city: String, state: String, completion: @escaping (Walkability?, Error?) -> ()) {
        
        let endpoint = "walkability"
        guard let url = URL(string: api + endpoint) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            //todo
            
        }
        task.resume()
    }
}
