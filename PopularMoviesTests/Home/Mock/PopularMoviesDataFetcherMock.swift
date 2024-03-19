//
//  PopularMoviesDataFetcherMock.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

final class PopularMoviesDataFetcherMock: PopularMoviesDataFetching {
    var request: [Movie] = []

    func getPopularMovies() async -> [Movie] {
        request
    }
}
