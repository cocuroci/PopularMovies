//
//  ViewConfiguration.swift
//  PopularMovies
//
//  Created by Andre on 29/11/22.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func buildLayout()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
