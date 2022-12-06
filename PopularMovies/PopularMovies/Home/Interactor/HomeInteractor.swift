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
            await configureImagePaths(configuration: configuration, movies: movies)
            await present(movies: movies)
        }
    }

    private func configureImagePaths(configuration: Configuration, movies: [Movie]) async {
        let imagesSecureBaseURL = configuration.images.secureBaseURL ?? ""
        let imagesSize = configuration.images.logoSizes.first{ $0 == "w300" } ?? ""
        self.movies = movies.map { .init(movie: $0, imagePath: imagesSecureBaseURL + imagesSize + $0.image) }
    }

    @MainActor
    private func present(movies: [Movie]) {
        presenter.present(movies: movies)
    }
}
