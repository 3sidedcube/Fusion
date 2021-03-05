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
        guard let size = size else { return nil }
        let fontSize = CGFloat(size)

        guard let fontName = name, let fontWeight = weight else {
            return UIFont.systemFont(ofSize: fontSize)
        }

        let name = "\(fontName)-\(fontWeight)"
        return UIFont(name: name, size: fontSize)
    }
}
