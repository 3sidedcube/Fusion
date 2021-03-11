//
//  UILabel+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `UILabel` defaults
extension UILabel {

    /// Set properties to defaults
    func setDefaults() {
        backgroundColor = .clear
        textColor = .defaultTextColor
        textAlignment = .left
        font = .default
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
    }
}
