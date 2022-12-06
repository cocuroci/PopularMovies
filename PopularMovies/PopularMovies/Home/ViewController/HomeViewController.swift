//
//  HomeViewController.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import UIKit

protocol HomeViewDisplaying: AnyObject {
    func display(movies: [Movie])
}

final class HomeViewController: BaseViewController {
    private let interactor: HomeInteracting
    private var movies: [Movie] = []

    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(useAutoLayout: true)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getPopularMovies()
    }

    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        view.addSubview(tableView)
    }

    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    override  func configureViews() {
        super.configureViews()
        title = "Filmes Populares"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(model: movies[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension HomeViewController: HomeViewDisplaying {
    func display(movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
}
