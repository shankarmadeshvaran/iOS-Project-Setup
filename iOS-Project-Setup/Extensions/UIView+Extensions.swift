//
//  UIView+Extensions.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func removeShadow() {
        layer.shadowOffset = CGSize(width: 0 , height: 0)
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.00
    }
    
    func hide() {
        isHidden = true
    }
    
    func show() {
        isHidden = false
    }
    
    func bounce() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.1,
                       options: UIView.AnimationOptions.beginFromCurrentState,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    func setGradientBackgroundColor(_ Colors:[Any],_ Angle:GradientPoint){
        let layer = CAGradientLayer()
        layer.name = "gradient"
        layer.colors = Colors
        layer.frame = self.bounds
        gradientPoint(Angle, layer)
        self.layer.insertSublayer(layer, at: 0)
    }
    private func gradientPoint(_ Point:GradientPoint, _ layer:CAGradientLayer) {
        switch Point {
        case .LeftToRight:
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 1, y: 0)
            break
        case .ToptoButtom:
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
            break
        case .TopLeftToButtomRight:
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 1, y: 1)
            break
        case .TopRightToButtomLeft:
            layer.startPoint = CGPoint(x: 1, y: 1)
            layer.endPoint = CGPoint(x: 0, y: 0)
            break
        case .BottomLeftToTopRight:
            layer.startPoint = CGPoint(x: 0, y: 1)
            layer.endPoint = CGPoint(x: 1, y: 0)
            break
        }
    }
    
    func dismissSlowly(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.hide()
        }
    }
    
    func presentSlowly(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.show()
        }
    }
    
    enum GradientPoint {
        case LeftToRight
        case ToptoButtom
        case TopLeftToButtomRight //135 degree
        case TopRightToButtomLeft //315 degree
        case BottomLeftToTopRight //45 degree
    }
}

extension UIView {
    
    func origin() -> CGPoint {
        return frame.origin
    }
    
    func setOrigin(_ newOrigin: CGPoint) {
        var newFrame: CGRect = frame
        newFrame.origin = newOrigin
        frame = newFrame
    }
    
    func size() -> CGSize {
        return frame.size
    }
    
    func setSize(_ newSize: CGSize) {
        var newFrame: CGRect = frame
        newFrame.size = newSize
        frame = newFrame
    }
    func x() -> CGFloat {
        return frame.origin.x
    }
    
    func setX(_ newX: CGFloat) {
        var newFrame: CGRect = frame
        newFrame.origin.x = newX
        frame = newFrame
    }
    
    func y() -> CGFloat {
        return frame.origin.y
    }
    
    func setY(_ newY: CGFloat) {
        var newFrame: CGRect = frame
        newFrame.origin.y = newY
        frame = newFrame
    }
    
    func height() -> CGFloat {
        return frame.height
    }
    
    func setHeight(_ newHeight: CGFloat) {
        var newFrame: CGRect = frame
        newFrame.size.height = newHeight
        frame = newFrame
    }
    
    func width() -> CGFloat {
        return frame.size.width
    }
    
    func setWidth(_ newWidth: CGFloat) {
        var newFrame: CGRect = frame
        newFrame.size.width = newWidth
        frame = newFrame
    }
    
    func maxx() -> CGFloat {
        return frame.maxX
    }
    
    func maxy() -> CGFloat {
        return frame.maxY
    }
    func minx() -> CGFloat {
        return frame.minX
    }
    
    func miny() -> CGFloat {
        return frame.minY
    }
    
    func vheight() -> CGFloat {
        return frame.height
    }
    
    func vWidth() -> CGFloat {
        return frame.width
    }
}

@IBDesignable extension UIView {
    
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
}
