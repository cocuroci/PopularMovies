//
//  Movie.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
    let voteAverage: Float

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }
}
