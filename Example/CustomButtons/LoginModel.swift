//
//  LoginModel.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct LoginModel : Codable {

    var userName : String
    var password : String
    
    static let sample = LoginModel(userName: "", password: "")
    
}
