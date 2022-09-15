//
//  UIViewController+Extensions.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//


import UIKit

extension UIViewController {
    
    func presentViewController(storyBoardName : AppStoryBoards , Identifier: AppControllers , presentType : ControllersPresentTypes) {
        
        let storyboard = UIStoryboard(name: storyBoardName.rawValue , bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier.rawValue)
        switch presentType {
        case .systemPresent:
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
        case .pushController:
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
