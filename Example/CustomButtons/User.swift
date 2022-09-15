//
//  User.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct User : Codable {
    
    var name : String
    var userName : String
    var password : String
    
    static let sample = User(name: "", userName: "", password: "")
}
