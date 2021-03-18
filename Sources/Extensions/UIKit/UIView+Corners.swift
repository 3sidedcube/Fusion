//
//  UIView+Corners.swift
//  Fusion
//
//  Created by Ben Shutt on 18/03/2021.
//

import Foundation
import UIKit

extension UIView {

    /// Make the `UIView` circular by:
    /// - Setting circular properties on the `layer`
    /// - Adding an `NSLayoutConstraint` so the `widthAnchor` is constrained equal to the `heightAnchor`
    func makeCircular() -> NSLayoutConstraint {
        // Update the layer.
        // Should be updated when `bounds` updates
        layer.setCorners(.circle)

        // Unique identifier for the width-height constraint
        let identifier = "com.fusion.circleConstraint"

        // Remove old circular constraints
        let oldConstraint = constraints.first { $0.identifier == identifier }
        if let oldConstraint = oldConstraint {
            return oldConstraint
        }

        // Add new circular constraint
        translatesAutoresizingMaskIntoConstraints = false
        let newConstraint = widthAnchor.constraint(equalTo: heightAnchor)
        newConstraint.identifier = identifier
        newConstraint.isActive = true
        return newConstraint
    }
}
