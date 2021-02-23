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
    let api = "https://h-ds2.cityspire.dev/"
    
    /// Function to retrieve walkability score
    /// - Parameters:
    ///  - city: city to be entered to get specific score
    ///  - state: state to be entered to get specific score
    ///  - completion: Closure that will be called when the request is complete
    func getWalkability(city: String, state: String, completion: @escaping (Walkability?, Error?) -> ()) {
        
        let endpoint = "walk_score?city=\(city)&state=\(state)"
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
    
    /// Function to retrieve rentals information
    /// - Parameters:
    ///  - city: city to be entered to get specific score
    ///  - state: state to be entered to get specific score
    ///  - type: property type
    ///  - limit: person limit
    ///  - completion: Closure that will be called when the request is complete
    func getRentals(city: String, state: String, type: String, limit: Int, completion: @escaping ([ForRent]?, Error?) -> ()) {
        let endpoint = "for_rent_list?api_key=%2A%2A%2A%2A%2A%2A%2A%2A%2A%2A&city=\(city)&state=\(state)&prop_type=\(type)&limit=\(limit)"
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
                    let forRent = try JSONDecoder().decode(Array<ForRent>.self, from: data)
                    completion(forRent, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            }
            
        }
        task.resume()
    }
    
    /// Function to retrieve information on places for sale
    /// - Parameters:
    ///  - city: city to be entered to get specific score
    ///  - state: state to be entered to get specific score
    ///  - type: property type
    ///  - limit: person limit
    ///  - completion: Closure that will be called when the request is complete
    func getForSale(city: String, state: String, type: String, limit: Int, completion: @escaping ([ForSale]?, Error?) -> ()) {
        let endpoint = "for_sale_list?api_key=%2A%2A%2A%2A%2A%2A%2A%2A%2A%2A&city=\(city)&state=\(state)&prop_type=\(type)&limit=\(limit)"
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
                    let forSale = try JSONDecoder().decode(Array<ForSale>.self, from: data)
                    completion(forSale, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            }
            
        }
        task.resume()
    }
}
