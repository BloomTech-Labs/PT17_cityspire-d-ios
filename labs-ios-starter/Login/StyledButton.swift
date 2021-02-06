//
//  StyledButton.swift
//  labs-ios-starter
//
//  Created by Fabiola S on 2/6/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

/// Class that will style UIButtons used in the app
class StyledButton: UIButton {
    
    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform:  nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        
        layer.cornerRadius = 10
    }
}
