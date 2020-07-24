//
//  UITextField+Extensions.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//


import Foundation
import UIKit

extension UITextField {
    func isEmpty() -> Bool {
        return self.text == ""
    }
}
