//
//  MapScreenViewController.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/3/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class MapScreenViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var favoriteButton: UIButton!
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var employmentLabel: UILabel!
    @IBOutlet var averageAgeLabel: UILabel!
    @IBOutlet var livabilityLabel: UILabel!
    @IBOutlet var rentalPriceLabel: UILabel!
    @IBOutlet var walkabilityLabel: UILabel!
    @IBOutlet var averageIncomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func employmentPressed(_ sender: Any) {
        
    }
    
    @IBAction func walkabilityPressed(_ sender: Any) {
        
    }
    
    @IBAction func averageAgePressed(_ sender: Any) {
        
    }
    
    @IBAction func livabilityPressed(_ sender: Any) {
        
    }
    
    @IBAction func rentalPressed(_ sender: Any) {
        
    }
    
    @IBAction func averageIncome(_ sender: Any) {
        
    }
    
}
