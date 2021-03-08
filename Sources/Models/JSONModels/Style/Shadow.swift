//
//  Shadow.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// Model based on Sketch shadow properties.
public struct Shadow: Codable {

    /// RGB hex color
    public var color: RGBAHex?

    /// Shadow opacity in the range [0, 1]
    public var alpha: Float?

    /// Shadow offset in x
    public var x: Float?

    /// Shadow offset in y
    public var y: Float?

    /// Shadow blur (2 * shadow radius)
    public var blur: Float?

    /// Shadow spread
    public var spread: Float?
}
