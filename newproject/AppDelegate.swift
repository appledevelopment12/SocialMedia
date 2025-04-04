//
//  AppDelegate.swift
//  newproject
//
//  Created by Rohit on 03/09/24.
//

import UIKit
import GooglePlaces
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FacebookCore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSPlacesClient.provideAPIKey("")// Google place api key 
        FirebaseApp.configure()
        return true
    }
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            let googleSignInHandled = GIDSignIn.sharedInstance.handle(url)
                    
                    // Handle Facebook Sign-In URL
            let facebookHandled = ApplicationDelegate.shared.application(app, open: url, options: options)
                    
            return googleSignInHandled || facebookHandled
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

