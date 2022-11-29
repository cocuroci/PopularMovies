//
//  Movie.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
    let voteAverage: Float
}
