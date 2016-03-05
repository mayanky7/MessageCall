//
//  AppDelegate.swift
//  MessageCall
//
//  Created by Mayank Yadav on 05/03/16.
//  Copyright © 2016 Code52. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let authenticator = Authenticator()
        authenticator.requestPermissions { (success) -> Void in
            if success {
                print("Sucessfully authenticated")
            } else {
                print("Authentication Failed")
            }
        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

