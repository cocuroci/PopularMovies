//
//  HomeCoordinator.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import UIKit

enum HomeAction {
    case detail(with: Movie)
}

protocol HomeCoordinating {
    var viewController: UIViewController? { get set }
    func perform(action: HomeAction)
}

final class HomeCoordinator: HomeCoordinating {
    weak var viewController: UIViewController?

    func perform(action: HomeAction) {
        switch action {
        case let .detail(with: movie):
            let detailViewController = DetailFactory.make(movie)
            viewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
