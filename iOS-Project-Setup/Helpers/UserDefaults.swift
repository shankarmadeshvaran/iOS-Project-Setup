//
//  UserDefaults.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation

public struct Standards {
    static let preferences = UserDefaults.standard
    struct Key {
        static let baseURL = "baseURL"
        static let isLoggedIn = "isLoggedIn"
        static let userName = "userName"
        static let password = "password"
    }
}

extension UserDefaults {
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            Standards.preferences.removePersistentDomain(forName: bundleID)
        }
    }
}
