//
//  TimeInterval+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func convertToHoursMinutes() -> String {
        if type(of: self) == Double.self {
            let interval = Int(fabs(self))
            let minutes = (interval / 60) % 60
            let hours = (interval / 3600)
            return String(format: "%02d:%02d", hours, minutes)
        } else if type(of: self) == Int.self {
            let interval = Int(abs(self))
            let minutes = (interval / 60) % 60
            let hours = (interval / 3600)
            return String(format: "%02d:%02d", hours, minutes)
        } else {
            let interval = UInt(self)
            let minutes = (interval / 60) % 60
            let hours = (interval / 3600)
            return String(format: "%02d:%02d", hours, minutes)
        }
    }
}
