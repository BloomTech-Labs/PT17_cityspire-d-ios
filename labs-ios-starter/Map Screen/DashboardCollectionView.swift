//
//  DashboardCollectionView.swift
//  labs-ios-starter
//
//  Created by Joe on 3/26/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withIdentifier: "CityCell") else { return UICollectionViewCell() }
        
        cityInstance = city[indexPath.row]
        cell.city = cityInstance
        
        return cell
    }
    
    
    
    
    
}
