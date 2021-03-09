//
//  CGFloat+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension CGFloat {

    /// Default for leading and trailing offset from their respective edges.
    /// E.g. views are often constrained by this from their parent in a horizontal direction.
    static var defaultHorizontalMargin: CGFloat = 20

    /// Default text size
    static var defaultTextSize: CGFloat = 12
}

extension Float {

    /// `defaultTextSize` to `Float`
    static var defaultTextSize = Float(CGFloat.defaultTextSize)
}
