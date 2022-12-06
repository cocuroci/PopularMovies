//
//  DetailInteractor.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

protocol DetailInteracting {
    func showMovie()
}

final class DetailInteractor: DetailInteracting {
    private let movie: Movie
    private let presenter: DetailPresenting

    init(movie: Movie, presenter: DetailPresenting) {
        self.movie = movie
        self.presenter = presenter
    }

    func showMovie() {
        presenter.present(movie: movie)
    }
}
