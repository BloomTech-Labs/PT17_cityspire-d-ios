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
    
    var searchItem = Map()
    var walkability: Walkability?
    var employmentStatement: String = ""
    var walkabilityStatement: String = ""
    var incomeStatement: String = ""
    var ageStatement: String = ""
    var livabilityStatement: String = ""
    var rentalStatement: String = ""

    var forRentObjects: [ForRent] = []
    var forSaleObjects: [ForSale] = []
        
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var employmentLabel: UILabel!
    @IBOutlet var averageAgeLabel: UILabel!
    @IBOutlet var livabilityLabel: UILabel!
    @IBOutlet var rentalPriceLabel: UILabel!
    @IBOutlet var walkabilityLabel: UILabel!
    @IBOutlet var averageIncomeLabel: UILabel!
    
    @IBOutlet var popUpTitleLabel: UILabel!
    @IBOutlet var popUpTextView: UITextView!
    
    var activityView = UIActivityIndicatorView(style: .large)
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateIn(desiredView: blurView, mid: true)
        activityView.center = self.view.center
        activityView.color = UIColor(named: "LightBlue")
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        let annotations = self.mapView.annotations
        self.mapView.removeAnnotations(annotations)
        
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(searchItem.lat, searchItem.long)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
        
        cityLabel.text = searchItem.cityName
        
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        popUpView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 1.5, height: self.view.frame.height / 3.5)
        popUpView.layer.cornerRadius = 5.0
    }
    
    func setUpViews() {
        walkabilityLabel.text = "\(walkability!.walk_score)"
        if walkability?.transit_score == nil {
            walkabilityStatement = "The overall walkability score of \(searchItem.cityName) ranks \(walkability!.walk_score) out of 100. This means that \(walkability!.walk_message). It also has a bike score of \(walkability!.bike_score)"
        } else {
            walkabilityStatement = "The overall walkability score of \(searchItem.cityName) ranks \(walkability!.walk_score). This means that \(walkability!.walk_message). It also has a bike score of \(walkability!.bike_score) and a transit score of \(walkability!.transit_score!)."
        }

    }
    
    func forRentals() {
        for object in forRentObjects {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(object.address.lat, object.address.lon)
            annotation.title = "For Rent"
            annotation.subtitle = object.address.line
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func forSale() {
        for object in forSaleObjects {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(object.address.lat, object.address.lon)
            annotation.title = "For Sale"
            annotation.subtitle = object.address.line
            self.mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSearch", sender: self)
    }
    @IBAction func favoriteCityPressed(_ sender: Any) {
    }
    
    @IBAction func employmentPressed(_ sender: Any) {
        popUpTextView.text = employmentStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Employment"
    }
    
    @IBAction func walkabilityPressed(_ sender: Any) {
        popUpTextView.text = walkabilityStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Walkability"
    }
    
    @IBAction func averageAgePressed(_ sender: Any) {
        popUpTextView.text = ageStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Average Age"
    }
    
    @IBAction func livabilityPressed(_ sender: Any) {
        popUpTextView.text = livabilityStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Livability"
    }
    
    @IBAction func rentalPressed(_ sender: Any) {
        popUpTextView.text = rentalStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Average Rent"
    }
    
    @IBAction func averageIncome(_ sender: Any) {
        popUpTextView.text = incomeStatement
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        popUpTitleLabel.text = "Average Income"
    }
    
    @IBAction func cancelPopUpView(_ sender: Any) {
        animateOut(desiredView: popUpView)
        animateOut(desiredView: blurView)
        popUpTextView.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    func animateIn(desiredView: UIView, mid: Bool) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        if mid == false{
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            desiredView.center = CGPoint(x: backgroundView.center.x, y: backgroundView.center.y - 100)
        } else {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            desiredView.center = backgroundView.center
        }
        
        UIView.animate(withDuration: 0.3) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    }
    
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
}

extension MapScreenViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "CityMain")
        switch annotation.title {
        case "For Rent":
            annotationView.markerTintColor = UIColor(named: "AccentYellow")
            annotationView.glyphImage = UIImage(systemName: "house.fill")
        case "For Sale":
            annotationView.markerTintColor = UIColor(named: "LightBlue")
            annotationView.glyphImage = UIImage(systemName: "dollarsign.circle.fill")
        default:
            annotationView.markerTintColor = UIColor(named: "LightBlue")
        }
        return annotationView
    }
}
