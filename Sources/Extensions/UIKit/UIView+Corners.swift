//
//  UIView+Corners.swift
//  Fusion
//
//  Created by Ben Shutt on 18/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    /// # Radius
    /// Set the radius on the layer and remove any circle constraints
    ///
    /// # Circular
    /// Make the `UIView` circular by:
    /// - Setting circular properties on the `layer`
    /// - Adding, if not there already, an `NSLayoutConstraint` so the `widthAnchor` is constrained
    ///   equal to the `heightAnchor`
    ///
    /// - Parameter corners: `Corners` to set
    @discardableResult
    func updateCorners(_ corners: Corners) -> NSLayoutConstraint? {
        layer.setCorners(corners)

        // Unique identifier for the width-height constraint
        let identifier = "com.fusion.circular"

        // Constraint setting width equal to height when making the view circular
        let circleConstraint = constraints.first { $0.identifier == identifier }

        switch corners {

        // Handle radius
        case .radius:
            // Remove constraint
            circleConstraint?.isActive = false
            return nil

        // Handle circular
        case .circular:
            // Add constraint unless it already exists
            if let constraint = circleConstraint {
                return constraint
            }

            // Add new circular constraint
            translatesAutoresizingMaskIntoConstraints = false
            let newConstraint = widthAnchor.constraint(equalTo: heightAnchor)
            newConstraint.identifier = identifier
            newConstraint.isActive = true
            return newConstraint
        }
    }
}
