//
//  Text+NSAttributedString.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension TextProperties {

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
        let backgroundColor = self.backgroundColor?.hexColor ?? .defaultBackgroundColor
        attributed.addAttribute(.backgroundColor, value: backgroundColor, range: range)

        // `textColor`
        let textColor = self.textColor?.hexColor ?? .defaultTextColor
        attributed.addAttribute(.foregroundColor, value: textColor, range: range)

        // `font`
        let font = self.font?.uiFont ?? .default
        attributed.addAttribute(.font, value: font, range: range)

        // `textAlignment`
        let textAlignment = self.textAlignment?.nsTextAlignment ?? .default
        paragraphStyle.alignment = textAlignment

        // `lineHeight`
        let lineHeight = self.lineHeight ?? CGFloat.defaultLineHeight.float
        paragraphStyle.lineHeightMultiple = 1
        paragraphStyle.lineSpacing = CGFloat(lineHeight) - font.lineHeight

        // `letterSpacing`
        let letterSpacing = self.letterSpacing ?? CGFloat.defaultLetterSpacing.float
        attributed.addAttribute(.kern, value: CGFloat(letterSpacing), range: range)

        // Commit attributes and set `attributedText`
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return attributed
    }
}
