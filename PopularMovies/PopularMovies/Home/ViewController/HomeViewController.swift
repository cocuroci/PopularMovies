//
//  HomeViewController.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import UIKit

final class HomeViewController: UIViewController, ViewConfiguration {
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }

    func buildViewHierarchy() {}

    func setupConstraints() {}

    func configureViews() {
        view.backgroundColor = .systemBlue
    }
}
