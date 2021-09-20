//
//  FontModel+Font.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension FontModel {

    /// Map to `Font`
    var font: Font {
        let size = size ?? .defaultFontSize
        let weight = weightCase ?? .defaultFontWeight

        // Check for a custom font
        guard let name = name else {
            return .defaultFont(size: size, weight: weight)
        }

        // Handle custom font
        let fontName = "\(name)-\(weight.rawValue.capitalized)"
        return .custom(fontName, size: size)
    }
}

// MARK: - FontModel.Weight

extension FontModel.Weight {

    var weight: Font.Weight {
        switch self {
        case .regular: return .regular
        case .bold: return .bold
        case .semiBold: return .semibold
        case .heavy: return .heavy
        case .light: return .light
        case .italic: return .regular // Trait rather than weight
        }
    }
}
