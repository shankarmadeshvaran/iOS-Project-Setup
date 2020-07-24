//
//  AppManager.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation

class AppManager: NSObject {
    class var sharedInstance: AppManager {
        struct Static {
            static let instance: AppManager = AppManager()
        }
        return Static.instance
    }
    
    func baseURL() -> String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    func isUserLoggedIn() -> Bool {
           var isUserLoggedIn: Bool = false
           if Standards.preferences.bool(forKey: Standards.Key.isLoggedIn){
               isUserLoggedIn = Standards.preferences.bool(forKey: Standards.Key.isLoggedIn)
           }
           return isUserLoggedIn
       }
}
