//
//  ConfigurationEndpoint.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

struct ConfigurationEndpoint: Endpoint {
    var path = "/configuration"
    var httpMethod = HTTPMethod.get
}
