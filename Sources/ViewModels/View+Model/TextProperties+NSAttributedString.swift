//
//  Text+NSAttributedString.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation
import UIKit

extension TextProperties {

    /// Map this `TextProperties` instance to `NSAttributedString`
    var attributedString: NSAttributedString {
        // `content`
        let string = content ?? ""

        // Set up `NSMutableAttributedString``
        let attributed = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: (string as NSString).length)

        // Set up `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail

        // `backgroundColor`
        if let backgroundColor = backgroundColor?.hexColor {
            attributed.addAttribute(.backgroundColor, value: backgroundColor, range: range)
        }

        // `textColor`
        if let textColor = textColor?.hexColor {
            attributed.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        // `font`
        let uiFont = font?.uiFont
        if let font = uiFont {
            attributed.addAttribute(.font, value: font, range: range)
        }

        // `textAlignment`
        if let textAlignment = textAlignment?.nsTextAlignment {
            paragraphStyle.alignment = textAlignment
        }

        // `lineHeight`
        if let lineHeight = lineHeight, let font = uiFont {
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.lineSpacing = CGFloat(lineHeight) - font.lineHeight
        }

        // `letterSpacing`
        if let letterSpacing = letterSpacing {
            let value = CGFloat(letterSpacing)
            attributed.addAttribute(.kern, value: value, range: range)
        }

        // Commit attributes and set `attributedText`
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return attributed
    }
}
