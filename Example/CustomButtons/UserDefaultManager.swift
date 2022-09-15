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
    
    
    
}

