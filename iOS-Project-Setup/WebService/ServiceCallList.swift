//
//  ServiceCallList.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

public struct APIURL {
    struct Domain {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    public struct ApiClass {
        static let userList = "/users"
    }
}

var baseURL: String {
    return AppManager.sharedInstance.baseURL()
}

