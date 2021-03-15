//
//  CALayer+Shadow.swift
//  MessageStackView
//
//  Created by Ben Shutt on 03/09/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CALayer + SketchShadow

public extension CALayer {

    /// Apply `shadow` to `CALayer`
    ///
    /// - Warning:
    /// This function sets the `shadowPath` based on the `bounds` of the layer
    ///
    /// - Note:
    /// The `.default` `SketchShadow` does not show shadow, it reverses the properties
    /// to their default
    ///
    /// - Parameter shadow: `Shadow`
    func setShadow(_ shadow: Shadow?) {
        setSketchShadow(shadow?.sketchShadow ?? .default)
    }
}
