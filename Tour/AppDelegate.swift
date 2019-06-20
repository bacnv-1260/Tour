//
//  AppDelegate.swift
//  Tour
//
//  Created by nguyen.van.bac on 6/3/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        FBSDKApplicationDelegate
            .sharedInstance()
            .application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if FBSDKAccessToken.current() != nil {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
        return handled
    }
}

