//
//  User.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct User : Codable , Equatable {
    
    var name : String
    var userName : String
    var password : String
    
    static let sample = User(name: "", userName: "", password: "")
}

extension User {
    func configureView(vc : MainViewController) {
        vc.userNameLbl.text = "Your username is: " + self.userName
        vc.nameLbl.text = "Your name is: " + self.name
    }
}
