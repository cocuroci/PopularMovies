//
//  ConfigurationDataFetcher.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

protocol ConfigurationDataFetching {
    func configuration() async -> Configuration
}

final class ConfigurationDataFetcher: ConfigurationDataFetching {
    private let network: Networking

    init(network: Networking) {
        self.network = network
    }
    
    func configuration() async -> Configuration {
        do {
            let configuration: Configuration = try await network.request(with: ConfigurationEndpoint())
            return configuration
        } catch {
            debugPrint(error)
            return .empty
        }
    }
}
