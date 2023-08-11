//
//  AppDelegate.swift
//  Learning-WkWebView
//
//  Created by Tiến Việt Trịnh on 07/08/2023.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "362020365352-m7cmn7bigom1fde66so47miq1podjm6u.apps.googleusercontent.com"
        
        return true
    }




}

