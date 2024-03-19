//
//  Movie.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import Foundation

struct Movie: Identifiable, Equatable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String
    let overview: String
    let voteAverage: Float

    init(id: Int, title: String, releaseDate: String, image: String, overview: String, voteAverage: Float) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.image = image
        self.overview = overview
        self.voteAverage = voteAverage
    }

    init(movie: Movie, imagePath: String) {
        self.id = movie.id
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.image = imagePath
        self.overview = movie.overview
        self.voteAverage = movie.voteAverage
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }
}
