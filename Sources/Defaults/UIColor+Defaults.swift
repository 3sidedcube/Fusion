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
    static let defaultHighlightedColor = UIColor(
        red255: 247, green255: 241, blue255: 247
    )

    /// Default value for `unhighlightedColor`
    static let defaultUnhighlightedColor: UIColor = .white

    /// Default text `UIColor`
    static let defaultTextColor = UIColor(red255: 68, green255: 68, blue255: 68)

    /// Default `UILabel` background `UIColor`
    static let defaultLabelBackgroundColor: UIColor = .clear

    /// Default `UITableViewCell` background `UIColor`
    static let defaultCellBackgroundColor: UIColor = .clear
}
