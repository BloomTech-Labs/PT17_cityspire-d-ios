//
//  MapViewController.swift
//  labs-ios-starter
//
//  Created by Joe on 3/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//
import MapKit
import UIKit

class MapViewController: UIViewController {
    
    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Action Items
    func updateViews() {
        guard let city = city else { return }
        let location = CLLocation(latitude: city.latitude, longitude: city.longitude)
        mapView.centerToLocation(location, city.city)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
