//
//  SearchViewController.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    var searchResponse = Map()
    var network = NetworkClient()
    
    
    // MARK: Outlets
    @IBOutlet weak var backgroundGradient: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackgroundColor()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Background gradient
    
    /// Sets the gradient colors for the background view
    func setGradientBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(named: "LightBlue")!.cgColor, UIColor(named: "MedBlue")!.cgColor ]
        gradientLayer.shouldRasterize = true
        backgroundGradient.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    func createStringURL(_ input: String) -> String {
        var string = ""
        
        string = input.replacingOccurrences(of: ",", with: "%2C")
        string = string.replacingOccurrences(of: " ", with: "%20")
        
        return string
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap" {
            let vc = segue.destination as! MapScreenViewController
            vc.searchItem = searchResponse
            
            network.getWalkability(address: createStringURL(searchBar.text!), lat: "\(self.searchResponse.lat)", lon: "\(self.searchResponse.long)") { (walkability, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        vc.performSegue(withIdentifier: "unwindToSearch", sender: self)
                    }
                    return
                }
                DispatchQueue.main.async {
                    vc.walkabilityLabel.text = "\(walkability!.walk_score)"
                    vc.activityView.stopAnimating()
                    vc.animateOut(desiredView: vc.blurView)
                    print(walkability!)
                }
            }
            network.getRentals(city: "Chico", state: "CA", type: "single_familiy", limit: 4) { (forRent, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        vc.performSegue(withIdentifier: "unwindToSearch", sender: self)
                    }
                    return
                }
                DispatchQueue.main.async {
                    print(forRent!)
                }
            }
        }
    }
}
    
    extension SearchViewController: UISearchBarDelegate {
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            let searchRequest = MKLocalSearch.Request()
            
            searchRequest.naturalLanguageQuery = searchBar.text
            let activeSearch = MKLocalSearch(request: searchRequest)
            
            activeSearch.start { (response, error) in
                if response == nil {
                    Alert.showBasicAlert(on: self, with: "Invalid Input", message: "Please use the format of \"City, State\"")
                } else {
                    self.searchResponse.long = (response?.boundingRegion.center.longitude)!
                    self.searchResponse.lat = (response?.boundingRegion.center.latitude)!
                    self.searchResponse.cityName = searchBar.text!
                    
                    self.performSegue(withIdentifier: "toMap", sender: self)
                }
            }
        }
    }
