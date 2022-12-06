//
//  HomePresenter.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomePresenting {
    var coordinator: HomeCoordinating { get }
    var viewController: HomeViewDisplaying? { get }
    func present(movies: [Movie])
    func presentDetail(movie: Movie)
}

final class HomePresenter: HomePresenting {
    let coordinator: HomeCoordinating
    weak var viewController: HomeViewDisplaying?

    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }

    func present(movies: [Movie]) {
        viewController?.display(movies: movies)
    }

    func presentDetail(movie: Movie) {
        coordinator.perform(action: .detail(with: movie))
    }
}
