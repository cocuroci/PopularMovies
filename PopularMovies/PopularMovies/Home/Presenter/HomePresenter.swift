//
//  HomePresenter.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomePresenting {
    var viewController: HomeViewDisplaying? { get }
    func present(movies: [Movie])
}

final class HomePresenter: HomePresenting {
    weak var viewController: HomeViewDisplaying?

    func present(movies: [Movie]) {
        viewController?.display(movies: movies)
    }
}
