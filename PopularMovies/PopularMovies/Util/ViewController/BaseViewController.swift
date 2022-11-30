//
//  BaseViewController.swift
//  PopularMovies
//
//  Created by Andre on 30/11/22.
//

import UIKit

class BaseViewController: UIViewController, ViewConfiguration {

    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.lightBackground.cgColor, UIColor.darkBackground.cgColor]
        return gradientLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        buildLayout()
    }

    func buildViewHierarchy() {}

    func setupConstraints() {}

    func configureViews() {
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
