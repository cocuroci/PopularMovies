//
//  NetworkError.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decode
    case unauthorized
    case unknown
}
