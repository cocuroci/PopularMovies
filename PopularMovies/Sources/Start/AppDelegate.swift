//
//  AppDelegate.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let apperance = UINavigationBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().compactAppearance = apperance
        UINavigationBar.appearance().tintColor = .white

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

