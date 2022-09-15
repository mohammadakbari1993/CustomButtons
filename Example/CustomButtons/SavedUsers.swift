//
//  SavedUsers.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

struct SavedUsers : Codable {
    
    var usersList : [User] = []
    
    static let sample = SavedUsers(usersList: [])
 
}

