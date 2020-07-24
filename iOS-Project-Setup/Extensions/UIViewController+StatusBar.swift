//
//  UIViewController+StatusBar.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//


import Foundation
import UIKit

extension UITabBarController {
    open override var childForStatusBarStyle: UIViewController? {
        return selectedViewController?.childForStatusBarStyle ?? selectedViewController
    }
}

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController?.childForStatusBarStyle ?? topViewController
    }
}
