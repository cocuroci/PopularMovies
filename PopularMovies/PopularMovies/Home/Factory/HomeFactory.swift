//
//  HomeFactory.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import UIKit

enum HomeFactory {
    typealias Parameters = Void

    static func make(_ parameters: Parameters) -> UIViewController {
        HomeViewController()
    }
}
