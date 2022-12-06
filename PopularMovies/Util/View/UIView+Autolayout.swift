//
//  UIView+Autolayout.swift
//  PopularMovies
//
//  Created by Andre on 30/11/22.
//

import Foundation
import UIKit

extension UIView {
    convenience init(useAutoLayout: Bool) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = !useAutoLayout
    }
}
