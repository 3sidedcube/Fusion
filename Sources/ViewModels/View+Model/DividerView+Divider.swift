//
//  DividerView+Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

extension DividerView {

    /// Set the given `divider`
    ///
    /// - Parameter divider: `Divider`
    func setDivider(_ divider: Divider) {
        // `color`
        dividerView.backgroundColor = divider.color?.hexColor ?? .clear

        // `strokeWidth`
        strokeWidth = CGFloat(max(0, divider.strokeWidth ?? 0))

        // `margin`
        margin = divider.margin?.insets ?? .zero
    }
}
