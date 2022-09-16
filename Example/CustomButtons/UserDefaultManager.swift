//
//  UserDefaultManager.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation


class UserDefaultManager {
    
    private let defaults = UserDefaults.standard
    
    static let shared = UserDefaultManager()
    
    
    /// Helps you to save a user in UserDefaults
    /// - Parameters:
    ///   - user: The user you want to save it
    ///   - success: Called when your operation has done successfully
    ///   - unsuccess: Called when an error occurs
    func addUserToUserDefaults(user : User, success : @escaping() -> Void ,unsuccess : @escaping(_ ErrorMessage : String) -> Void) {
        
        do{
            try RegisterValidator.verify(user: user)
        } catch(let error) {
            unsuccess(error.localizedDescription)
            return
        }
        
        
        var userList = self.readUsersList()
        
        userList.usersList.append(user)
        
        let encoder = JSONEncoder()
       
        if let encoded = try? encoder.encode(userList) {
            defaults.set(encoded, forKey: "SavedPerson")
            success()
        } else {
            unsuccess("Some Uknow Error happend...")
        }
        
    }
    
    /// Return the list of your users
    /// - Returns: Users List
    func readUsersList() -> SavedUsers {
        
        if let savedPerson = defaults.object(forKey: "SavedPerson") as? Data {
            
            let decoder = JSONDecoder()
           
            if let loadedPerson = try? decoder.decode(SavedUsers.self, from: savedPerson) {
                return loadedPerson
            } else {
                return .sample
            }
            
        } else {
            return .sample
        }
    }
    
    
    /// Save the time of your login time
    /// - Parameter date: login time
    func saveLoginSession(date : TimeInterval) {
        defaults.set(date, forKey: "saveLoginSession")
    }
    
    /// Return your login time
    /// - Returns: login time
    func getLoginSessionTime() -> TimeInterval {
        return defaults.double(forKey: "saveLoginSession")
    }
    

}

