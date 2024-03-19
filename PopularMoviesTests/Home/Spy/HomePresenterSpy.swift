//
//  HomePresenterSpy.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

final class HomePresenterSpy: HomePresenting {
    var coordinator: HomeCoordinating
    var viewController: HomeViewDisplaying?

    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }

    private(set) var presentCalled = 0
    private(set) var presentDetailCalled = 0

    func present(movies: [Movie], configuration: Configuration) {
        presentCalled += 1
    }

    func presentDetail(movie: Movie, configuration: Configuration) {
        presentDetailCalled += 1
    }
}
