//
//  CALayer+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    func addBorder(edge: String, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case "topLeft":
            border.frame = CGRect(x: 0, y: 0, width: 15, height: thickness)
        case "topRight":
            border.frame = CGRect(x: bounds.width - 15, y: 0, width: 15, height: thickness)
        case "rightTop":
            border.frame = CGRect(x: bounds.width, y: 0, width: thickness, height: 15)
        case "leftTop":
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: 15)
        case "bottomLeft":
            border.frame = CGRect(x: 0, y: bounds.height - 15, width: thickness, height: 15)
        case "bottomRight":
            border.frame = CGRect(x: bounds.width - 15, y: bounds.height, width: 15, height: thickness)
        case "rightBottom":
            border.frame = CGRect(x: bounds.width, y: bounds.height - 15, width: thickness, height: 15)
        case "leftBottom":
            border.frame = CGRect(x: 0, y: bounds.height, width: 15, height: thickness)
        default: do {}
        }
        border.backgroundColor = color.cgColor
        
        addSublayer(border)
    }
}
