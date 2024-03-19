//
//  MovieMock.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

extension Movie {
    static var mock: Movie {
        .init(
            id: 1,
            title: "title",
            releaseDate: "releaseDate",
            image: "releaseDate",
            overview: "overview",
            voteAverage: 5
        )
    }
}
