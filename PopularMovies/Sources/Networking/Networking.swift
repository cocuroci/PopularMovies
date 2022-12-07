//
//  Networking.swift
//  PopularMovies
//
//  Created by Andre on 01/12/22.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(with endpoint: Endpoint, jsonDecoder: JSONDecoder) async throws -> T
}

extension Networking {
    func request<T: Decodable>(with endpoint: Endpoint, jsonDecoder: JSONDecoder = JSONDecoder()) async throws -> T {
        return try await request(with: endpoint, jsonDecoder: jsonDecoder)
    }
}
