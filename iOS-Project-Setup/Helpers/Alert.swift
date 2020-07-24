//
//  Alert.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
   private static func showAlert(on vc:UIViewController,with title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true, completion: nil) }
    }
    
    static func showAlertEmptyField(on vc:UIViewController, message: String){
        showAlert(on: vc, with: "", message: message)
    }
    
    static func showAlertSuccessRequest(on vc:UIViewController,title: String, message: String) {
        showAlert(on: vc, with: title, message: message)
    }
    
    static func showAlertError(on vc:UIViewController, message: String) {
        showAlert(on: vc, with: "Error", message: message)
    }
    
    static func showtInternetFailureAlert(on vc:UIViewController){
        showAlert(on: vc, with: "", message: "")
    }
    
}

