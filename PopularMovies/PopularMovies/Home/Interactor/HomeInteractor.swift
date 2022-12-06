//
//  PopularMoviesInteracting.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomeInteracting {
    func getPopularMovies()
}

final class HomeInteractor: HomeInteracting {
    private var movies: [Movie] = []
    private let dataFetcher: PopularMoviesDataFetching
    private let presenter: HomePresenting

    init(dataFetcher: PopularMoviesDataFetching, presenter: HomePresenting) {
        self.dataFetcher = dataFetcher
        self.presenter = presenter
    }

    func getPopularMovies() {
        Task {
            movies = await dataFetcher.getPopularMovies()
            await present(movies: movies)
        }
    }

    @MainActor
    private func present(movies: [Movie]) {
        presenter.present(movies: movies)
    }
}
