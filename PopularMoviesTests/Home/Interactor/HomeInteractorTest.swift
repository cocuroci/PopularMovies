//
//  HomeInteractorTest.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import XCTest
@testable import PopularMovies

final class HomeInteractorTest: XCTestCase {
    var sut: HomeInteractor!
    var popularMoviesDataFetcherMock: PopularMoviesDataFetcherMock!
    var configurationDataFetcherMock: ConfigurationDataFetching!
    var homePresenterSpy: HomePresenterSpy!

    override func setUp() {
        popularMoviesDataFetcherMock = PopularMoviesDataFetcherMock()
        configurationDataFetcherMock = ConfigurationDataFetcherMock()
        homePresenterSpy = HomePresenterSpy(coordinator: HomeCoordinator())

        sut = HomeInteractor(
            moviesDataFetcher: popularMoviesDataFetcherMock,
            configurationDataFetcher: configurationDataFetcherMock,
            presenter: homePresenterSpy
        )
    }

    func testGetPopularMoviesShouldCallPresent() async {
        await sut.getPopularMovies()
        XCTAssertEqual(homePresenterSpy.presentCalled, 1)
    }

    func testDidSelectMovieWhenInvalidIndexPathShouldNotCallPresentDetail() async {
        sut.didSelectMovie(with: .init(row: 0, section: 0))
        XCTAssertEqual(self.homePresenterSpy.presentDetailCalled, 0)
    }

    func testDidSelectMovieShouldCallPresentDetail1() async {
        popularMoviesDataFetcherMock.request = [.mock]
        await sut.getPopularMovies()
        sut.didSelectMovie(with: .init(row: 0, section: 0))

        XCTAssertEqual(self.homePresenterSpy.presentDetailCalled, 1)
    }
}
