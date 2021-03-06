//
//  Font+UIFont.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension Font {

    /// Map this `Font` instance to a `UIFont`
    var uiFont: UIFont {
        return font() ?? systemFont()
    }

    /// Get size of font
    private var fontSize: CGFloat {
        return size?.cgFloat ?? .defaultTextSize
    }

    /// Try get `UIFont` from  `name` and `weight`
    private func font() -> UIFont? {
        guard let fontName = name, let weight = weight else { return nil }
        let fontWeight = weight.capitalized
        let name = "\(fontName)-\(fontWeight)"
        return UIFont(name: name, size: fontSize)
    }

    /// Try get system `UIFont` with `weight` falling back on default system `UIFont`
    private func systemFont() -> UIFont {
        guard let fontWeight = fontWeight else {
            return UIFont.systemFont(ofSize: fontSize)
        }

        let uiFontWeight = fontWeight.uiFontWeight
        let font = UIFont.systemFont(ofSize: fontSize, weight: uiFontWeight)
        return fontWeight.addingTraitsToFont(font)
    }
}

// MARK: - Font.Weight

public extension Font.Weight {

    /// Map to `UIFont.Weight`
    var uiFontWeight: UIFont.Weight {
        switch self {
        case .regular: return .regular
        case .bold: return .bold
        case .semiBold: return .semibold
        case .heavy: return .heavy
        case .light: return .light
        case .italic: return .regular
        }
    }

    /// Add ` UIFontDescriptor.SymbolicTraits` to the `UIFont`
    /// - Parameter font: `UIFont`
    func addingTraitsToFont(_ font: UIFont) -> UIFont {
        guard case .italic = self else { return font }
        return font.addingTraits(.traitItalic)
    }
}
