//
//  UIViewController+Extensions.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//


import UIKit

extension UIViewController {
    
    
    
    /// This Method will help you that how you can present you'r controllers
    /// - Parameters:
    ///   - storyBoardName: The StoryBoard that You'r Controller belong that.
    ///   - Identifier: Identifier of your controller
    ///   - presentType: The way you want to present your controller , There are two type, [1:systemPresent, 2: pushController]
    func presentViewController(storyBoardName : AppStoryBoards , Identifier: AppControllers , presentType : ControllersPresentTypes) {
        
        let storyboard = UIStoryboard(name: storyBoardName.rawValue , bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier.identifier)
        switch presentType {
        case .systemPresent:
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
        case .pushController:
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    /// This method will help you that, change your rootController so easily
    /// - Parameters:
    ///   - storyBoardName: The StoryBoard that You'r Controller belong that.
    ///   - Identifier: Identifier of your controller
    func changeRootViewWithAnimation(storyBoardName : AppStoryBoards , Identifier: AppControllers)  {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let storyboard = UIStoryboard(name: storyBoardName.rawValue , bundle: nil)
        
        
        switch Identifier {
            
        case .MainViewController(let user):
            if let vc = storyboard.instantiateViewController(withIdentifier: Identifier.identifier) as? MainViewController {
                vc.user = user
                window.rootViewController = vc
            }
        default :
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.identifier)
            window.rootViewController = vc
        }
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
                            { completed in
            // maybe do something on completion here
        })
        
    }
    
    
    /// When This method called, Timer starting to control your session time.
    func runTimerForSession() {
        var runCount = 0
       
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount = Int(Date().timeIntervalSince1970 - UserDefaultManager.shared.getLoginSessionTime())

            if runCount > 30 {
                timer.invalidate()
                NotificationCenter.default.post(name: NSNotification.Name.sessionExpired, object: nil, userInfo: nil)
            }
        }
        
    }
}
