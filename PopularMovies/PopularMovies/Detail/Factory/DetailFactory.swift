//
//  DetailFactory.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import UIKit

enum DetailFactory {
    typealias Parameters = Movie

    static func make(_ parameters: Parameters) -> UIViewController {
        let presenter = DetailPresenter()
        let interactor = DetailInteractor(movie: parameters, presenter: presenter)
        let viewController = DetailViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
