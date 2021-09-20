//
//  File.swift
//  
//
//  Created by Ben Shutt on 09/09/2021.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
import UIKit
typealias AppColor = UIColor
#elseif canImport(AppKit)
import AppKit
typealias AppColor = NSColor
#endif

extension Color {

    /// Red, green, blue opacity components of a color.
    /// Components in the range [0, 1]
    struct RGBA {

        /// Red component
        var red: Double

        /// Green component
        var green: Double

        /// Blue component
        var blue: Double

        /// Opacity component
        var opacity: Double
    }

    /// Get `RGBA` components from `UIColor`
    var rgba: RGBA {
        let appColor = AppColor(self)

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        appColor.getRed(&red, green: &green, blue: &blue, alpha: &opacity)

        return RGBA(
            red: Double(red),
            green: Double(green),
            blue: Double(blue),
            opacity: Double(opacity)
        )
    }
}
