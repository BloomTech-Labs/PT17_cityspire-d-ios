//
//  CardView.swift
//  labs-ios-starter
//
//  Created by Fabiola S on 1/31/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

/// Class that will create the cardview out of a UIView in the Search screen
class CardView: UIView {
    
    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform:  nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 9, height: 10)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 35
        
        layer.cornerRadius = 35
    }
}
