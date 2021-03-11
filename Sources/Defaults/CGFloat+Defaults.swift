//
//  CGFloat+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `CGFloat` defaults
extension CGFloat {

    /// Default text size
    static let defaultTextSize: CGFloat = 12
}

// MARK: - Float + CGFloat

extension Float {

    /// Map to `CGFloat`
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

// MARK: - CGFloat + Float

extension CGFloat {

    /// Map to `Float`
    var float: Float {
        return Float(self)
    }
}
