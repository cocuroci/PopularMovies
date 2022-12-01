//
//  Network.swift
//  PopularMovies
//
//  Created by Andre on 02/12/22.
//

import Foundation

final class Network: Networking {
    func request<T>(with endpoint: Endpoint, jsonDecoder: JSONDecoder) async throws -> T where T : Decodable {
        let urlRequest = try endpoint.asURLRequest()
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)

        guard let urlResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch urlResponse.statusCode {
        case 200...299:
            do {
                let result: T = try jsonDecoder.decode(T.self, from: data)
                return result
            } catch {
                throw NetworkError.decode
            }
        case 401:
            throw NetworkError.unauthorized
        default:
            throw NetworkError.unknown
        }
    }
}
