//
//  ImagesPath.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

struct Configuration: Decodable {
    let images: ImagesPath
}

extension Configuration {
    static let empty = Configuration(images: .init(baseURL: nil, secureBaseURL: nil, logoSizes: []))
}

struct ImagesPath: Decodable {
    let baseURL: String?
    let secureBaseURL: String?
    let logoSizes: [String]

    private enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case logoSizes = "logo_sizes"
    }
}
