//
//  Date+Extensions.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/16/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
