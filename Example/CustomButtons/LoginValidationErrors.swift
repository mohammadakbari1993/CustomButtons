//
//  LoginValidationErrors.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

enum LoginValidationErrors: Error {
    
    case userNameIsEmpty
    case passwordIsEmpty
    case passwordIsTooLong
    case passwordIsTooShort
    case userNotExist
    case passwordIsIncorrect
        
}

extension LoginValidationErrors: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .userNameIsEmpty:
            return "User-Name field is empty, Please Insert a valid User-Name"
        case .passwordIsEmpty:
            return "Password field is empty, Please Insert a valid password"
        case .passwordIsTooLong:
            return "Password's lengh is too long, password should be 5-10 charachter"
        case .passwordIsTooShort:
            return "Password's lengh is too short, password should be 5-10 charachter"
        case .userNotExist:
            return "The user is not exist"
        case .passwordIsIncorrect :
            return "Inserted password is incorrect"
        }
       
    }
    
}
