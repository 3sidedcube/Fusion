//
//  UIColor+Colors.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `UIColor` defaults
extension UIColor {

    /// Default value for `highlightedColor`
    static let defaultHighlightedColor = UIColor(red255: 247, green: 241, blue: 247)

    /// Default text `UIColor`
    static let defaultTextColor = UIColor(red255: 68, green: 68, blue: 68)

    /// Default `UIView` background `UIColor`
    static let defaultBackgroundColor: UIColor = .clear

    /// Placeholder color before remote image has loaded
    static let placeholder = UIColor(white255: 63).withAlphaComponent(0.1)

    /// Default stroke color of separators
    public static let defaultSeparatorColor = UIColor(white255: 238)
}
