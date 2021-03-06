//
//  UILabel+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation
import UIKit

public extension UILabel {

    /// Set `Text` on this `UILabel` instance by setting `attributedText` to
    /// an `NSAttributedString` with all the properties configured
    ///
    /// - Parameter text: `Text`
    func setText(_ text: Text) {
        // `text`
        self.text = nil
        let string = text.text ?? ""

        // Set up `NSMutableAttributedString``
        let attributed = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: (string as NSString).length)

        // Set up `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.lineBreakStrategy = lineBreakStrategy

        // `backgroundColor`
        self.backgroundColor = text.backgroundColor?.hexColor

        // `textColor`
        self.textColor = nil
        if let textColor = text.textColor?.hexColor {
            attributed.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        // `font`
        self.font = nil
        let uiFont = text.font?.uiFont
        if let font = uiFont {
            attributed.addAttribute(.font, value: font, range: range)
        }

        // `textAlignment`
        self.textAlignment = .left
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

        // `padding` relies on the `UILabel` been `Insettable`
        if let insets = text.padding?.insets, let insettable = self as? Insettable {
            insettable.setInsets(insets)
        }

        // Commit attributes and set `attributedText`
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        self.attributedText = attributed
    }
}
