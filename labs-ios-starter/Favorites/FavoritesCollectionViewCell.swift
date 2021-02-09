//
//  FavoritesCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var livabiltyLabel: UILabel!
    @IBOutlet var walkabilityLabel: UILabel!
    @IBOutlet var avgIncomeLabel: UILabel!
    
}
