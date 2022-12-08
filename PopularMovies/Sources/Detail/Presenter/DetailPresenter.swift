//
//  DetailPresenter.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import Foundation

protocol DetailPresenting {
    var viewController: DetailViewDisplaying? { get }
    func present(viewModel: DetailViewModel)
}

final class DetailPresenter: DetailPresenting {
    weak var viewController: DetailViewDisplaying?

    func present(viewModel: DetailViewModel) {
        viewController?.display(viewModel: viewModel)
    }
}
