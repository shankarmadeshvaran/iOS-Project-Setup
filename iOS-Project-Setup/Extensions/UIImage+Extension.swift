//
//  UIImage+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//


import Foundation
import UIKit

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
