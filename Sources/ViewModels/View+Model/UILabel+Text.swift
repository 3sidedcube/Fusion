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
    /// - Parameters:
    ///   - text: `Text`
    ///   - setViewProperties: `Bool` Set
    func setText(_ text: Text?, setViewProperties: Bool = true) {
        // `content`
        self.text = nil
        let string = text?.content ?? ""

        // Set up `NSMutableAttributedString``
        let attributed = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: (string as NSString).length)

        // Set up `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.lineBreakStrategy = lineBreakStrategy

        // `textColor`
        textColor = .defaultTextColor
        if let textColor = text?.textColor?.hexColor {
            attributed.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        // `font`
        font = .default
        let uiFont = text?.font?.uiFont
        if let font = uiFont {
            attributed.addAttribute(.font, value: font, range: range)
        }

        // `textAlignment`
        textAlignment = .default
        if let textAlignment = text?.textAlignment?.nsTextAlignment {
            paragraphStyle.alignment = textAlignment
        }

        // `numberOfLines`
        numberOfLines = text?.numberOfLines ?? .defaultNumberOfLines

        // `lineHeight`
        if let lineHeight = text?.lineHeight, let font = uiFont {
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.lineSpacing = CGFloat(lineHeight) - font.lineHeight
        }

        // `letterSpacing`
        if let letterSpacing = text?.letterSpacing {
            let value = CGFloat(letterSpacing)
            attributed.addAttribute(.kern, value: value, range: range)
        }

        // Commit attributes and set `attributedText`
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attributedText = attributed

        // `view-model`
        //setViewModel(setViewProperties ? text : nil)
        // TODO
    }
}
