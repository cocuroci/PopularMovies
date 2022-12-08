//
//  PopularMoviesInteracting.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomeInteracting {
    func getPopularMovies()
    func didSelectMovie(with indexPath: IndexPath)
}

final class HomeInteractor: HomeInteracting {
    private var configuration: Configuration = .empty
    private var movies: [Movie] = []
    private let moviesDataFetcher: PopularMoviesDataFetching
    private let configurationDataFetcher: ConfigurationDataFetching
    private let presenter: HomePresenting

    init(
        moviesDataFetcher: PopularMoviesDataFetching,
        configurationDataFetcher: ConfigurationDataFetching,
        presenter: HomePresenting
    ) {
        self.moviesDataFetcher = moviesDataFetcher
        self.configurationDataFetcher = configurationDataFetcher
        self.presenter = presenter
    }

    func getPopularMovies() {
        Task {
            configuration = await configurationDataFetcher.configuration()
            movies = await moviesDataFetcher.getPopularMovies()
            await present(movies: movies, configuration: configuration)
        }
    }

    func didSelectMovie(with indexPath: IndexPath) {
        guard movies.indices.contains(indexPath.row) else {
            return
        }

        let selectedMovies = movies[indexPath.row]
        presenter.presentDetail(movie: selectedMovies, configuration: configuration)
    }

    @MainActor
    private func present(movies: [Movie], configuration: Configuration) {
        presenter.present(movies: movies, configuration: configuration)
    }
}
