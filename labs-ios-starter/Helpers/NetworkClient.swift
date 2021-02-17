//
//  NetworkClient.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct NetworkClient {
    let api = "https://h-ds2.cityspire.dev/"
    
    func getWalkability(address: String, lat: String, lon: String,  completion: @escaping (Walkability?, Error?) -> ()) {
        
        let endpoint = "walk_score?address=\(address))&lat=\("\(lat)")&lon=\("\(lon)")"
        guard let url = URL(string: api + endpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response!)")
                return
            }
            
            if let data = data {
                do {
                    let walkability = try JSONDecoder().decode(Walkability.self, from: data)
                    completion(walkability, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            }
            
        }
        task.resume()
    }
}
