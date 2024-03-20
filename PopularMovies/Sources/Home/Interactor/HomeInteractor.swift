//
//  PopularMoviesInteracting.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomeInteracting {
    func getPopularMovies() async
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

    func getPopularMovies() async {
        configuration = await configurationDataFetcher.configuration()
        movies = await moviesDataFetcher.getPopularMovies()
        await present(movies: movies, configuration: configuration)
    }

    func didSelectMovie(with indexPath: IndexPath) {
        guard movies.indices.contains(indexPath.row) else {
            return
        }

        let selectedMovies = movies[indexPath.row]
        presenter.presentDetail(movie: selectedMovies, configuration: configuration)
    }

    private func present(movies: [Movie], configuration: Configuration) async {
        await presenter.present(movies: movies, configuration: configuration)
    }
}
