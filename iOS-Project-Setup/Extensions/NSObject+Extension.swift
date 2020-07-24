//
//  NSObject+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
    
}
