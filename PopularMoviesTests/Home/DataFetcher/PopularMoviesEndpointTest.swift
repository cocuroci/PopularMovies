//
//  PopularMoviesEndpointTest.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import XCTest
@testable import PopularMovies

final class PopularMoviesEndpointTest: XCTestCase {
    func testPopularEndpoint() {
        let sut = PopularMoviesEndpoint.popular
        XCTAssertEqual(sut.httpMethod, .get)
        XCTAssertEqual(sut.path, "/movie/popular")
    }
}
