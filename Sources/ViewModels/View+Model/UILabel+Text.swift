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
        let string = text.content ?? ""

        // Set up `NSMutableAttributedString``
        let attributed = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: (string as NSString).length)

        // Set up `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.lineBreakStrategy = lineBreakStrategy

        // `backgroundColor`
        backgroundColor = text.backgroundColor?.hexColor

        // `textColor`
        textColor = .defaultTextColor
        if let textColor = text.textColor?.hexColor {
            attributed.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        // `font`
        font = .default
        let uiFont = text.font?.uiFont
        if let font = uiFont {
            attributed.addAttribute(.font, value: font, range: range)
        }

        // `textAlignment`
        textAlignment = .left
        if let textAlignment = text.textAlignment?.nsTextAlignment {
            paragraphStyle.alignment = textAlignment
        }

        // `numberOfLines`
        numberOfLines = text.numberOfLines ?? 0

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

        // `border`
        layer.setBorder(text.border)

        // `margin` ignored

        // Commit attributes and set `attributedText`
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attributedText = attributed
    }
}
