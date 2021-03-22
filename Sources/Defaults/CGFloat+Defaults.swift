//
//  CGFloat+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `CGFloat` defaults
extension CGFloat {

    /// Default text size
    static let defaultTextSize: CGFloat = 14

    /// Max width of `UIImageView` in `DefaultView`
    static let defaultViewImageMaxWidth: CGFloat = 100

    /// Max height of `UIImageView` in `DefaultView`
    static let defaultViewImageMaxHeight: CGFloat = 100

    /// Default line height
    static let defaultLineHeight: CGFloat = 24

    /// Default letter spacing
    static let defaultLetterSpacing: CGFloat = 0

    /// Spacing before accessory view
    static let defaultAccessorySpacing: CGFloat = 20
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
