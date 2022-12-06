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
        let dataFetcher = PopularMoviesDataFetcher(network: Network())
        let presenter = HomePresenter()
        let interactor = HomeInteractor(dataFetcher: dataFetcher, presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
