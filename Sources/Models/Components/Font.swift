//
//  Font.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Properties which map to a `UIFont`
public struct Font: Codable {

    /// Name of the font, e.g. "OpenSans"
    public var name: String?

    /// Weight of the font, e.g. "regular"
    public var weight: String?

    /// Size of the font in pt, e.g. 10
    public var size: Float?
}

// MARK: - Font.Weight

public extension Font {

    /// Properties which map to a`UIFont.Weight`
    enum Weight: String, Codable, CaseIterable {

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

    /// Map `weight` to `Font.Weight`
    var fontWeight: Font.Weight? {
        guard let weight = weight else { return nil }
        return Weight(rawValue: weight)
    }
}
