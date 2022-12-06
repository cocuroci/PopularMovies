//
//  DetailPresenter.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

protocol DetailPresenting {
    var viewController: DetailViewDisplaying? { get }
    func present(movie: Movie)
}

final class DetailPresenter: DetailPresenting {
    weak var viewController: DetailViewDisplaying?

    func present(movie: Movie) {
        viewController?.display(movie: movie)
    }
}
