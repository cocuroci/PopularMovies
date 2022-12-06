//
//  Endpoint.swift
//  PopularMovies
//
//  Created by Andre on 02/12/22.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    func asURLRequest() throws -> URLRequest
}

extension Endpoint {
    var baseURL: String {
        "https://api.themoviedb.org/3"
    }

    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }

        let resultURL = url
            .appending(path: path)
            .appending(queryItems: [
                .init(name: "api_key", value: Constants.apiKey)
            ])

        var urlRequest = URLRequest(url: resultURL)
        urlRequest.httpMethod = httpMethod.rawValue
        return urlRequest
    }
}
