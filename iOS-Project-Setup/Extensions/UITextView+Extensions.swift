//
//  UITextView+Extensions.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func addCornerBorder() {
        layer.cornerRadius = 8
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addPlaceHolderText(placeholder: String) {
        text = placeholder
        textColor = UIColor.lightGray
    }
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
}
