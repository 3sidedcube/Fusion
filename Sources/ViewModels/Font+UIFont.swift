//
//  Font+UIFont.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation
import UIKit

public extension Font {

    /// Map this `Font` instance to a `UIFont`
    var uiFont: UIFont? {
        let fontSize = CGFloat(size ?? Defaults.fontSizePt)

        // Create system `UIFont` for the given `fontSize
        let systemFont = UIFont.systemFont(ofSize: fontSize)

        guard
            let fontName = name,
            let fontWeight = weight?.rawValue.capitalized
        else {
            return systemFont
        }

        let name = "\(fontName)-\(fontWeight)"
        return UIFont(name: name, size: fontSize) ?? systemFont
    }
}
