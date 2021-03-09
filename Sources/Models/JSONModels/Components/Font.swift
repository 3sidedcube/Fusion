//
//  Font.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Properties which map to a `UIFont`
public struct Font: Codable {

    /// Properties which map to a`Font.Weight`
    public enum Weight: String, Codable {

        /// "Regular" font
        case regular

        /// "Bold" font
        case bold

        /// "SemiBold" font
        case semiBold

        /// "Heavy" font
        case heavy

        /// "Light" font
        case light

        /// "Italic" font
        case italic
    }

    /// Name of the font, e.g. "Open Sans"
    public var name: String?

    /// Weight of the font, e.g. "Regular"
    public var weight: Weight?

    /// Size of the font in pt, e.g. 10
    public var size: Float?
}
