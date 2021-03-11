//
//  UIColor+Colors.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `UIColor` defaults
extension UIColor {

    /// Default value for `highlightedColor`
    static var defaultHighlightedColor = UIColor(
        red255: 247, green255: 241, blue255: 247
    )

    /// Default value for `unhighlightedColor`
    static var defaultUnhighlightedColor: UIColor = .white

    /// Default text color
    static var defaultTextColor = UIColor(red255: 68, green255: 68, blue255: 68)
}
