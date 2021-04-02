//
//  MapHelper.swift
//  labs-ios-starter
//
//  Created by Joe on 4/1/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000,
        city: String
    ) {
        let coordinateRegion = MKCoordinateRegion (
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        pin.title = city
        addAnnotation(pin)
    }
}
