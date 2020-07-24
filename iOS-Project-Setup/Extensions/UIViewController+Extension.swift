//
//  UIViewController+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Display message in prompt view
    ///
    /// - Parameters:
    ///   - title: Pass title to display as header line
    ///   - message: Pass string of content message
    ///   - options: Pass multiple actions title like "OK","Cancel" etc
    ///   - completion: The block to execute after the presentation finishes.
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        topMostController().present(alertController, animated: true, completion: nil)
    }
    
    /// Get the top most view in the app
    ///
    /// - Returns: It returns current foreground viewcontroller
    func topMostController() -> UIViewController {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        var topController: UIViewController? = keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }
    
}
