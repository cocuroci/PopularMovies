//
//  HomeCoordinatorSpy.swift
//  PopularMoviesTests
//
//  Created by Andre on 19/03/24.
//  Copyright © 2024 Cocuroci. All rights reserved.
//

import Foundation
import UIKit
@testable import PopularMovies

final class HomeCoordinatorSpy: HomeCoordinating {
    var viewController: UIViewController?

    private(set) var performCalled = 0
    private(set) var actionCalled: HomeAction!

    func perform(action: HomeAction) {
        performCalled += 1
        actionCalled = action
    }
}
