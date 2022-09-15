//
//  RegisterValidator.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct RegisterValidator {
    
    static func verify(user : User) throws{
        
        guard !user.name.isEmpty else {
            throw RegisterValidationErrors.nameIsEmpty
        }

        guard !user.userName.isEmpty else {
            throw RegisterValidationErrors.userNameIsEmpty
        }
        
        guard !user.password.isEmpty else {
            throw RegisterValidationErrors.passwordIsEmpty
        }

        guard !(user.password.count < 5) else {
            throw RegisterValidationErrors.passwordIsTooShort
        }
        
        guard !(user.password.count > 10) else {
            throw RegisterValidationErrors.passwordIsTooLong
        }
        
        guard !(UserDefaultManager.shared.readUsersList().usersList.compactMap({$0.userName}).contains(user.userName)) else {
            throw RegisterValidationErrors.userAlreadyExist(userName: user.userName)
        }
        
    }
}
