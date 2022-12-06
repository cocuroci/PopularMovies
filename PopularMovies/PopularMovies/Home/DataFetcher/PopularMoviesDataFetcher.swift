//
//  PopularMoviesDataFetcher.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol PopularMoviesDataFetching {
    func getPopularMovies() async -> [Movie]
}

final class PopularMoviesDataFetcher: PopularMoviesDataFetching {
    private let network: Networking

    init(network: Networking) {
        self.network = network
    }

    func getPopularMovies() async -> [Movie] {
        do {
            let results: MoviesResult = try await network.request(with: PopularMoviesEndpoint.popular)
            return results.results
        } catch {
            debugPrint(error)
            return []
        }
    }
}
