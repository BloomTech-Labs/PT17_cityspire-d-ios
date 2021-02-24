//
//  FavoritesViewController.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import CoreData
import MapKit

/// Class to handle logic for Favorites screen collection view
class FavoritesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var colletionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var favorites: [Favorite]?

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidAppear(_ animated: Bool) {
        fetchFavorites()
    }

    func fetchFavorites() {
        do {
            self.favorites = try context.fetch(Favorite.fetchRequest())

            DispatchQueue.main.async {
                self.colletionView.reloadData()
            }
        }
        catch {
            print("error fetching data")
        }

    }

    // MARK: - IBActions
    @IBAction func backNavigationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSearch", sender: self)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoritesCollectionViewCell

        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(favorites![indexPath.row].lat, favorites![indexPath.row].lon)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        cell.mapView.setRegion(region, animated: false)

        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)

        cell.cityTitleLabel.text = favorites![indexPath.row].name

        cell.walkabilityLabel.text = "Walkability: \(favorites![indexPath.row].walkabilityScore)"

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 3)
        }

    @objc func buttonClicked(sender: UIButton) {
        self.context.delete(self.favorites![sender.tag])

        do {
            try self.context.save()
            self.fetchFavorites()
        }
        catch {
            print("error deleting")
        }
    }

}
