//
//  PopularMoviesEndpoint.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

enum PopularMoviesEndpoint: Endpoint {
    case popular

    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .popular:
            return .get
        }
    }
}
