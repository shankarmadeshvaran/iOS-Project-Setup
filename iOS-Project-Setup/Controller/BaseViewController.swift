//
//  BaseViewController.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupCustomizedNavBar(navTitle: String) {
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.navigationController!.navigationBar.bounds
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        updatedFrame.size.height += statusBarHeight
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [UIColor(red: 58/255, green: 67/255, blue: 235/255, alpha: 1.0).cgColor, UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        
        self.title = navTitle
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: kFontRobotoMedium, size: 20)!]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func customEmployeeNavbar(backTitle: String){
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.navigationController!.navigationBar.bounds
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        updatedFrame.size.height += statusBarHeight
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [UIColor(red: 58/255, green: 67/255, blue: 235/255, alpha: 1.0).cgColor, UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)

        let backButton = UIBarButtonItem()
        backButton.title = backTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addGradientBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0).cgColor,UIColor(red: 58/255, green: 67/255, blue: 235/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func addNavigationBarButtons() {
        let refreshButton = UIButton(type: .system)
        refreshButton.setImage(UIImage(named: "refresh_icon")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        refreshButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: refreshButton)
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}
