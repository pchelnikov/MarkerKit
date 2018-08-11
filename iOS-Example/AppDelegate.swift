//
//  AppDelegate.swift
//  MarkerKit
//
//  Created by Mikhail Pchelnikov on 27/12/2017.
//  Copyright © 2017 Michael Pchelnikov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        let vc = ViewController()
        window?.rootViewController = vc
        
        return true
    }
}
