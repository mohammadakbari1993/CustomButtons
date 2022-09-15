//
//  RegisterValidationErrors.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

enum RegisterValidationErrors: Error {
    
    case nameIsEmpty
    case userNameIsEmpty
    case passwordIsEmpty
    case passwordIsTooLong
    case passwordIsTooShort
    case userAlreadyExist(userName : String)
        
}

extension RegisterValidationErrors: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .nameIsEmpty:
            return "Name field is empty, Please Insert a valid name"
        case .userNameIsEmpty:
            return "User-Name field is empty, Please Insert a valid User-Name"
        case .passwordIsEmpty:
            return "Password field is empty, Please Insert a valid password"
        case .passwordIsTooLong:
            return "Password's lengh is too long, password should be 5-10 charachter"
        case .passwordIsTooShort:
            return "Password's lengh is too short, password should be 5-10 charachter"
        case .userAlreadyExist(let userName) :
            return "The user name : \(userName), Already exist in our list"
        }
       
    }
    
}
