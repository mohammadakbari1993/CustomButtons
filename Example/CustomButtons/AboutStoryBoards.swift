//
//  AboutStoryBoards.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

enum ControllersPresentTypes {
    case systemPresent
    case pushController
}

enum AppStoryBoards : String {
    case Main = "Main"
}

enum AppControllers {
    
    case ViewController
    case LoginViewController
    case MainViewController(user : User)
    case MainNavigationController
    var identifier : String {
        switch self {
        case .ViewController:
            return "ViewController"
        case .LoginViewController:
            return "LoginViewController"
        case .MainViewController:
            return "MainViewController"
        case .MainNavigationController :
            return "MainNavigationController"
        }
    }
    
}
