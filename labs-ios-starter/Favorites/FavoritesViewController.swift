//
//  FavoritesViewController.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet var colletionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backNavigationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSearch", sender: self)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoritesCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 3)
        }
    
}
