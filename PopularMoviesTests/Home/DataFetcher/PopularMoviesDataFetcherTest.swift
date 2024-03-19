//
//  PopularMoviesDataFetcherSpec.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import XCTest
@testable import PopularMovies

final class PopularMoviesDataFetcherTest: XCTestCase {
    var networkMock: NetworkMock!

    override func setUp() {
        networkMock = NetworkMock()
    }

    func testGetPopularMoviesSuccess() async {
        let result = MoviesResult.mock
        networkMock.requests.append(.success(result))
        let sut = await PopularMoviesDataFetcher(network: networkMock).getPopularMovies()
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut, [.mock])
    }

    func testGetPopularMoviesFail() async {
        networkMock.requests.append(.failure(NetworkError.unknown))
        let sut = await PopularMoviesDataFetcher(network: networkMock).getPopularMovies()
        XCTAssertEqual(sut.count, 0)
    }
}
