//
//  NetworkMock.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import XCTest
@testable import PopularMovies

final class NetworkMock: Networking {
    var requests = [Result<Decodable, Error>]()
    func request<T>(with endpoint: Endpoint, jsonDecoder: JSONDecoder) async throws -> T where T : Decodable {
        guard let request = requests.popLast() else {
            fatalError()
        }
        switch request {
        case let .failure(error):
            throw error
        case let .success(model):
            return model as! T
        }
    }
}
