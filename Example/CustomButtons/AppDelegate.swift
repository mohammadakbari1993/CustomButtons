//
//  AppDelegate.swift
//  CustomButtons
//
//  Created by mohammadakbari1993 on 09/13/2022.
//  Copyright (c) 2022 mohammadakbari1993. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeRootView), name: NSNotification.Name.sessionExpired, object: nil)
        
        return true
        
    }
    
    @objc func changeRootView() {
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.changeRootViewWithAnimation(storyBoardName: .Main, Identifier: .MainNavigationController)
        }

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaultManager.shared.saveLoginSession(date: UserDefaultManager.shared.getLoginSessionTime() - 20)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

