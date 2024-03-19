//
//  MoviesResultMock.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

extension MoviesResult {
    static var mock: MoviesResult {
        .init(results: [.mock])
    }
}
