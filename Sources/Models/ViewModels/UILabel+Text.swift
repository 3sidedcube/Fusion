//
//  UILabel+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation
import UIKit

public extension UILabel {

    /// Set `Text` on this `UILabel` instance by setting an `attributedText` to
    /// an `NSAttributedString` with all the properties configured
    ///
    /// - Parameter text: `Text`
    func setText(_ text: Text) {
        // `text`
        self.text = nil // Reset
        let string = text.text ?? ""

        // Set up `NSMutableAttributedString``
        let attributed = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: (string as NSString).length)

        // Set up `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.lineBreakStrategy = lineBreakStrategy

        // `backgroundColor`
        self.backgroundColor = text.backgroundColor?.hexColor // Reset

        // `textColor`
        self.textColor = nil // Reset
        if let textColor = text.textColor?.hexColor {
            attributed.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        // `font`
        self.font = nil // Reset
        let uiFont = text.font?.uiFont
        if let font = uiFont {
            attributed.addAttribute(.font, value: font, range: range)
        }

        // `textAlignment`
        self.textAlignment = .left // Reset
        if let textAlignment = text.textAlignment?.nsTextAlignment {
            paragraphStyle.alignment = textAlignment
        }

        // `numberOfLines`
        self.numberOfLines = text.numberOfLines ?? 0

        // `lineHeight`
        if let lineHeight = text.lineHeight, let font = uiFont {
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.lineSpacing = CGFloat(lineHeight) - font.lineHeight
        }

        // `letterSpacing`
        if let letterSpacing = text.letterSpacing {
            let value = CGFloat(letterSpacing)
            attributed.addAttribute(.kern, value: value, range: range)
        }

        // Commit
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        self.attributedText = attributed
    }
}
