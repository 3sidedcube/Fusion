//
//  DividerTableViewCell+Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension DividerTableViewCell {

    /// Set the given `divider`
    ///
    /// - Parameter divider: `Divider`
    func setDivider(_ divider: Divider) {
        // `color`
        dividerView.backgroundColor = divider.color?.hexColor ?? .clear

        // `strokeWidth`
        dividerHeightConstraint.constant = CGFloat(divider.strokeWidth ?? 0)

        // `margin`
        dividerInsets = divider.margin?.insets ?? .zero
    }
}
