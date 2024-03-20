//
//  HomePresenterTest.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import XCTest
@testable import PopularMovies

final class HomePresenterTest: XCTestCase {
    var sut: HomePresenter!
    var homeCoordinatorSpy: HomeCoordinatorSpy!
    var homeViewDisplaySpy: HomeViewDisplaySpy!

    override func setUp() {
        homeCoordinatorSpy = HomeCoordinatorSpy()
        homeViewDisplaySpy = HomeViewDisplaySpy()
        sut = HomePresenter(coordinator: homeCoordinatorSpy)
        sut.viewController = homeViewDisplaySpy
    }

    func testPresentShouldCallDisplay() {
        sut.present(movies: [], configuration: .empty)
        XCTAssertEqual(homeViewDisplaySpy.displayCalled, 1)
    }

    func testPresentDetailShouldCallDisplay() {
        let viewModel = DetailViewModel(
            title: "title",
            imageURL: "releaseDate",
            voteAverage: "Classificação dos usuários: 5.0",
            description: "overview"
        )
        sut.presentDetail(movie: .mock, configuration: .empty)
        XCTAssertEqual(homeCoordinatorSpy.performCalled, 1)
        XCTAssertEqual(homeCoordinatorSpy.actionCalled, .detail(with: viewModel))
    }
}
