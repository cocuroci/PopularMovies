//
//  HomePresenter.swift
//  PopularMovies
//
//  Created by Andre on 03/12/22.
//

import Foundation

protocol HomePresenting {
    var coordinator: HomeCoordinating { get }
    var viewController: HomeViewDisplaying? { get }
    func present(movies: [Movie], configuration: Configuration) async
    func presentDetail(movie: Movie, configuration: Configuration)
}

final class HomePresenter: HomePresenting {
    let coordinator: HomeCoordinating
    weak var viewController: HomeViewDisplaying?

    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }

    func present(movies: [Movie], configuration: Configuration) async {
        await viewController?.display(viewModels: cofigureViewModel(configuration: configuration, movies: movies))
    }

    func presentDetail(movie: Movie, configuration: Configuration) {
        let imagePath = imagePath(with: configuration)
        let detailViewModel = DetailViewModel(
            title: movie.title,
            imageURL: imagePath + movie.image,
            voteAverage: "Classificação dos usuários: \(movie.voteAverage)",
            description: movie.overview
        )

        coordinator.perform(action: .detail(with: detailViewModel))
    }

    private func cofigureViewModel(configuration: Configuration, movies: [Movie]) -> [MovieViewModel] {
        let imagePath = imagePath(with: configuration)

        return movies.map {
            MovieViewModel(
                title: $0.title,
                releaseDate: formatterDate(with: $0.releaseDate),
                imageURL: imagePath + $0.image
            )
        }
    }

    private func formatterDate(with dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: dateString) else {
            return "Data indisponível"
        }

        dateFormatter.dateFormat = "dd/MM/yyy"
        return "Lançamento: \(dateFormatter.string(from: date))"
    }

    private func imagePath(with configuration: Configuration) -> String {
        let imagesSecureBaseURL = configuration.images.secureBaseURL ?? ""
        let imagesSize = configuration.images.logoSizes.first{ $0 == "w300" } ?? ""
        return imagesSecureBaseURL + imagesSize
    }
}
