//
//  Alert.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/10/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import Foundation

/// Alert that allows global use throughout app with changed responses on the stated view controller
struct Alert {
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
}
