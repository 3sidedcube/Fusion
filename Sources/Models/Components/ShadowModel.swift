//
//  ShadowModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Model based on Sketch shadow properties.
public struct ShadowModel: Codable {

    /// RGBA hex color
    public var color: RGBAHex?

    /// Shadow offset in x
    public var x: Points?

    /// Shadow offset in y
    public var y: Points?

    /// Shadow blur (2 * shadow radius)
    public var blur: Points?

    /// Shadow spread
    public var spread: Points?
}

// MARK: - ShadowModel + SketchShadow

public extension ShadowModel {

    /// Map to `SketchShadow`
    var sketchShadow: SketchShadow {
        let fallback: SketchShadow = .default
        return SketchShadow(
            color: color?.hexColor ?? fallback.color,
            x: x ?? fallback.x,
            y: y ?? fallback.y,
            blur: blur ?? fallback.blur,
            spread: spread ?? fallback.spread
        )
    }
}
