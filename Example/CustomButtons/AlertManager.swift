//
//  AlertManager.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

struct AlertManager {
    
    /// This method helps you to show your messages to user.
    /// - Parameters:
    ///   - title: Title of your message
    ///   - message: Your message
    ///   - buttonTitle: Title of alert's button
    ///   - on: Where you want to show the alert.
    static func showSimpleAlert(title : String, message : String , buttonTitle : String ,on : UIViewController ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        on.present(alert, animated: true, completion: nil)
    }
    
}
