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
        let network = Network()
        let coordinator = HomeCoordinator()
        let presenter = HomePresenter(coordinator: coordinator)
        let moviesDataFetcher = PopularMoviesDataFetcher(network: network)
        let configurationDataFetcher = ConfigurationDataFetcher(network: network)
        let interactor = HomeInteractor(
            moviesDataFetcher: moviesDataFetcher,
            configurationDataFetcher: configurationDataFetcher,
            presenter: presenter
        )
        let viewController = HomeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
