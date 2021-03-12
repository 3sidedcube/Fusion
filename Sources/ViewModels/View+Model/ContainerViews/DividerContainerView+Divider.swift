//
//  dividerView.+Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

extension DividerContainerView {

    /// Set the given `divider`
    ///
    /// - Parameter divider: `Divider`
    func setDivider(_ divider: Divider) {
        // `strokeWidth`
        dividerView.strokeWidth = CGFloat(max(0, divider.strokeWidth ?? 0))

        // `view-model`
        setViewModel(divider)

        // Overwrite `backgroundColor`
        let backgroundColor = divider.backgroundColor?.hexColor ?? .defaultBackgroundColor
        dividerView.backgroundColor = .defaultBackgroundColor
        dividerView.dividerView.backgroundColor = backgroundColor
    }
}
