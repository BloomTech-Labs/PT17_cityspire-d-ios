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
    
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)

    }
    
    @IBAction func employmentPressed(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
        
    }
    
    @IBAction func walkabilityPressed(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
    }
    
    @IBAction func averageAgePressed(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
    }
    
    @IBAction func livabilityPressed(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
    }
    
    @IBAction func rentalPressed(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
    }
    
    @IBAction func averageIncome(_ sender: Any) {
        animateIn(desiredView: blurView, mid: true)
        animateIn(desiredView: popUpView, mid: true)
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
