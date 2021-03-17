//
//  UILabel+TextProperties.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation
import UIKit

public extension UILabel {

    /// Set the given `textProperties`
    ///
    /// - Parameter textProperties: `TextProperties`
    func setTextProperties(_ textProperties: TextProperties?) {
        setDefaults()

        // `attributedString`
        attributedText = textProperties?.attributedString

        // `numberOfLines`
        numberOfLines = textProperties?.numberOfLines ?? .defaultNumberOfLines
    }
}
