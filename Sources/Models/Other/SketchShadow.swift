//
//  SketchShadow.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

/// Model based on Sketch shadow properties.
public struct SketchShadow {

    /// Shadow color
    public var color: Color

    /// Shadow offset in x
    public var x: Points

    /// Shadow offset in y
    public var y: Points

    /// Shadow blur (2 * shadow radius)
    public var blur: Points

    /// Shadow spread
    public var spread: Points

    // MARK: - Init

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - color: `Color`
    ///   - x: `Points`
    ///   - y: `Points`
    ///   - blur: `Points`
    ///   - spread: `Points`
    public init(
        color: Color,
        x: Points,
        y: Points,
        blur: Points,
        spread: Points
    ) {
        self.color = color
        self.x = x
        self.y = y
        self.blur = blur
        self.spread = spread
    }
}

// MARK: - Default

public extension SketchShadow {

    /// `SketchShadow` with the default shadow properties
    static var `default`: SketchShadow {
        return SketchShadow(
            color: .black.opacity(0), x: 0, y: -3, blur: 6, spread: 0
        )
    }
}
