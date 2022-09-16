//
//  MainViewController.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/16/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var user : User = .sample
    
     var userNameLbl : UILabel = {
      
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        lbl.font = UIFont.systemFont(ofSize: 16)
         lbl.textAlignment = .center
         lbl.numberOfLines = 2
        return lbl
        
    }()
    
     var nameLbl : UILabel = {
      
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 60))
        lbl.font = UIFont.systemFont(ofSize: 24)
         lbl.textAlignment = .center
         lbl.numberOfLines = 2
        return lbl
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.runTimerForSession()
        self.setFrames()
    }
    
    func setFrames() {
        
        nameLbl.center = self.view.center
        userNameLbl.center = self.view.center
        userNameLbl.frame.origin.y = self.userNameLbl.frame.origin.y + 60
        
        self.view.addSubview(nameLbl)
        self.view.addSubview(userNameLbl)
        
        user.configureView(vc: self)
    
    }
    

}
