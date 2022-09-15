//
//  LoginValidator.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct LoginValidator {
    
    static func verify(model : LoginModel) throws{
        

        guard !model.userName.isEmpty else {
            throw LoginValidationErrors.userNameIsEmpty
        }
        
        guard !model.password.isEmpty else {
            throw LoginValidationErrors.passwordIsEmpty
        }

        guard !(model.password.count < 5) else {
            throw LoginValidationErrors.passwordIsTooShort
        }
        
        guard !(model.password.count > 10) else {
            throw LoginValidationErrors.passwordIsTooLong
        }

        guard let user = UserDefaultManager.shared.readUsersList().usersList.filter({$0.userName == model.userName}).last else {
            throw LoginValidationErrors.userNotExist
        }
        
        guard user.password == model.password else {
            throw LoginValidationErrors.passwordIsIncorrect
        }
        
        
    }
}
