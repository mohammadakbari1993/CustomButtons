//
//  LoginManager.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct LoginManager {
    
    
    /// This method called for your login operation
    /// - Parameters:
    ///   - model: The login model, user inputs to login.
    ///   - success: Called when your operation has done successfully
    ///   - unsuccess: Called when an error occurs
    static func Login(model : LoginModel, success : @escaping(_ user : User) -> Void ,unsuccess : @escaping(_ ErrorMessage : String) -> Void) {
        
        do{
            try LoginValidator.verify(model: model)
        } catch(let error) {
            unsuccess(error.localizedDescription)
            return
        }
        
        guard let user = UserDefaultManager.shared.readUsersList().usersList.filter({$0.userName == model.userName && $0.password == model.password}).last else {
            unsuccess("Some Uknow Error happend...")
            return
        }
        
        success(user)
        
    }
    
}
