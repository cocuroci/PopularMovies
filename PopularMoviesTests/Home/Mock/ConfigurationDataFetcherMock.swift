//
//  ConfigurationDataFetcherMock.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
@testable import PopularMovies

final class ConfigurationDataFetcherMock: ConfigurationDataFetching {
    var request = Configuration.empty

    func configuration() async -> Configuration {
        request
    }
}
