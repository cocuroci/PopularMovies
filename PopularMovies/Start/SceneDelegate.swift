//
//  SceneDelegate.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = NavigationViewController(rootViewController: HomeFactory.make(()))

        self.window = window
        self.window?.makeKeyAndVisible()
    }
}
