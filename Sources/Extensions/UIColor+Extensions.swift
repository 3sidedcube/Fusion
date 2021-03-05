//
//  UIColor+Extensions.swift
//  CBIT
//
//  Created by Ben Shutt on 19/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    /// Red, green, blue alpha color components
    struct RGBA {

        /// Red component
        var red: CGFloat

        /// Green component
        var green: CGFloat

        /// Blue component
        var blue: CGFloat

        /// alpha component
        var alpha: CGFloat
    }

    /// Shorthand for creating a `UIColor` with RGB ranges in [0, 255].
    ///
    /// - Parameters:
    ///   - displayP3Red255: Red P3 component in [0, 255]
    ///   - green255: Green P3 component in [0, 255]
    ///   - blue255: Blue P3 component in [0, 255]
    ///   - alpha: Alpha in [0, 1]
    convenience init(
        red255: CGFloat,
        green255: CGFloat,
        blue255: CGFloat,
        alpha: CGFloat = 1
    ) {
        self.init(
            red: red255 / 255,
            green: green255 / 255,
            blue: blue255 / 255,
            alpha: alpha
        )
    }

    /// Shorthand for creating a `UIColor` with white in [0, 255].
    ///
    /// - Parameters:
    ///   - white255: White component in [0, 255]
    ///   - alpha: Alpha in [0, 1]
    convenience init(
        white255: CGFloat,
        alpha: CGFloat = 1
    ) {
        self.init(
            white: white255 / 255,
            alpha: alpha
        )
    }

    // MARK: - Hex

    /// Initialize `UIColor` with the given HEX `string`
    ///
    /// - Parameter string: `String` hex formatted color
    convenience init? (hexString string: String) {
        var hex = string.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }

        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return nil
        }

        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }

    /// Get RGBA components from `UIColor`
    var rgba: RGBA {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }

    /// `UIColor` to RGB HEX `String`
    var hexString: String {
        let rgba = self.rgba
        let rgb: Int = (Int)(rgba.red * 255) << 16 |
            (Int)(rgba.green * 255) << 8 |
            (Int)(rgba.blue * 255) << 0
        return String(format: "#%06x", rgb)
    }
}

// MARK: - String + UIColor

extension String {

    /// Convert this hex `String` instance to a `UIColor`
    var hexColor: UIColor? {
        return UIColor(hexString: self)
    }
}
