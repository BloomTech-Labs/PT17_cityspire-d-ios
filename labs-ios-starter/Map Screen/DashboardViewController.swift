//
//  DashboardViewController.swift
//  labs-ios-starter
//
//  Created by AAron on 3/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//
import CoreData
import MapKit
import UIKit

/// Class controls MapView and Dashboard. User is able to view Favorite Cities in Dashboard
class DashboardViewController: UIViewController {
    
    // Context for CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - IBOutlets
    @IBOutlet weak var employmentLabel: UILabel!
    @IBOutlet weak var averageAgeLabel: UILabel!
    @IBOutlet weak var livabilityLabel: UILabel!
    @IBOutlet weak var rentalLabel: UILabel!
    @IBOutlet weak var walkabilityLabel: UILabel!
    @IBOutlet weak var averageIncomeLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    // MARK: - Properties



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
    }
}
