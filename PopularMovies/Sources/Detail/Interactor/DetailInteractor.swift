//
//  DetailInteractor.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

protocol DetailInteracting {
    func showMovie()
}

final class DetailInteractor: DetailInteracting {
    private let viewModel: DetailViewModel
    private let presenter: DetailPresenting

    init(viewModel: DetailViewModel, presenter: DetailPresenting) {
        self.viewModel = viewModel
        self.presenter = presenter
    }

    func showMovie() {
        presenter.present(viewModel: viewModel)
    }
}
