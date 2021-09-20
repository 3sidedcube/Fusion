//
//  FontModel.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Model of font properties
public struct FontModel: Codable {

    /// Name of the font, e.g. "OpenSans"
    public var name: String?

    /// Weight of the font, e.g. "regular"
    public var weight: String?

    /// Size of the font in pt, e.g. 10
    public var size: Points?
}

// MARK: - FontModel.Weight

public extension FontModel {

    /// Model of font weight cases
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
        ///
        /// - Note:
        /// A "trait" in iOS rather than a weight.
        /// Since font files have "Italic" suffixed in the same way as "Bold", it makes
        /// sense to be a case here
        case italic
    }

    /// Map `weight` to `Font.Weight`
    var weightCase: FontModel.Weight? {
        guard let weight = weight else { return nil }
        return Weight(rawValue: weight)
    }
}
