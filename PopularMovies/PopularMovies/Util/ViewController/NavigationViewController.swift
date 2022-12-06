//
//  NavigationViewController.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import UIKit

final class NavigationViewController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .default
    }
}
