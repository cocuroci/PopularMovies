//
//  HomeCoordinator.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import UIKit

enum HomeAction: Equatable {
    case detail(with: DetailViewModel)
}

protocol HomeCoordinating {
    var viewController: UIViewController? { get set }
    func perform(action: HomeAction)
}

final class HomeCoordinator: HomeCoordinating {
    weak var viewController: UIViewController?

    func perform(action: HomeAction) {
        switch action {
        case let .detail(with: viewModel):
            let detailViewController = DetailFactory.make(viewModel)
            viewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
