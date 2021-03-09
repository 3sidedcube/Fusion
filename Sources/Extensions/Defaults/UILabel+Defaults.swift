//
//  UILabel+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension UILabel {

    /// Set properties to defaults
    func setDefaults() {
        backgroundColor = .clear
        textColor = .defaultTextColor
        textAlignment = .left
        font = UIFont.systemFont(ofSize: .defaultTextSize)
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
    }
}
