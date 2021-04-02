//
//  DashboardViewController.swift
//  labs-ios-starter
//
//  Created by AAron on 3/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//
import UIKit

/// Class controls MapView and Dashboard. User is able to view Favorite Cities in Dashboard
class DashboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var employmentLabel: UILabel!
    @IBOutlet weak var averageAgeLabel: UILabel!
    @IBOutlet weak var livabilityLabel: UILabel!
    @IBOutlet weak var rentalLabel: UILabel!
    @IBOutlet weak var walkabilityLabel: UILabel!
    @IBOutlet weak var averageIncomeLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var city: City?
    var favoriteCities: [Favorite]?


    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func searchButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Methods
    func updateViews() {
        livabilityLabel.text = city.livability
        walkabilityLabel.text = city.walkability
        rentalLabel.text = city.rentalPrice
        cityNameLabel.text = city.city
    }
}