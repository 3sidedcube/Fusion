//
//  FontModel+LegacyFont.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

#if canImport(UIKit)
import UIKit
typealias LegacyFont = UIFont
typealias LegacyFontDescriptor = UIFontDescriptor
#else
import AppKit
typealias LegacyFont = NSFont
typealias LegacyFontDescriptor = NSFontDescriptor
#endif

/// This legacy extension is only needed because `pointSize` and `lineHeight`
/// are not properties available on the SwiftUI `Font`.
extension FontModel {

    /// Map this `FontModel` instance to a `LegacyFont`
    var legacyFont: LegacyFont {
        return customFont() ?? systemFont()
    }

    /// Get size of font
    private var fontSize: Points {
        return Points(size ?? .defaultFontSize)
    }

    /// Try get `UIFont` from  `name` and `weight`
    private func customFont() -> LegacyFont? {
        guard let fontName = name, let weight = weightCase else { return nil }
        let fontWeight = weight.rawValue.capitalized
        let name = "\(fontName)-\(fontWeight)"
        return LegacyFont(name: name, size: fontSize)
    }

    /// Try get system `UIFont` with `weight` falling back on default system `UIFont`
    private func systemFont() -> LegacyFont {
        let weight = (weightCase ?? .defaultFontWeight).legacyWeight
        return LegacyFont.systemFont(ofSize: fontSize, weight: weight)
    }
}

// MARK: - FontModel.Weight

extension FontModel.Weight {

    /// Map to `UIFont.Weight`
    var legacyWeight: LegacyFont.Weight {
        switch self {
        case .regular: return .regular
        case .bold: return .bold
        case .semiBold: return .semibold
        case .heavy: return .heavy
        case .light: return .light
        case .italic: return .regular
        }
    }
}
