//
//  HomeViewDisplaySpy.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

final class HomeViewDisplaySpy: HomeViewDisplaying {
    private(set) var displayCalled = 0

    func display(viewModels: [MovieViewModel]) {
        displayCalled += 1
    }
}
