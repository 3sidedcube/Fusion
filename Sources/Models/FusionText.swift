//
//  FusionText.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct FusionText: Model {

    var value: String
    var isMarkdown: Bool
    var textColor: RGBAHex
    var font: FusionFont
    var alignment: FusionTextAlignment
    var lineHeight: Px
    var letterSpacing: Px
    var numberOfLines: Int
}

// MARK: - Computed

extension FusionText {

    /// Map `font` to `Font.Name`
    var fontName: Font.Name {
        guard let fontName = font.name else { return .system }
        return .custom(fontName)
    }

    /// Map `textColor` to `Color` falling back on a default
    var foregroundColor: Color {
        Color(hexString: textColor) ?? .defaultTextColor
    }
}

// MARK: - View

extension FusionText: View {

    var body: some View {
        Text(value, isMarkdown: isMarkdown)
            .style(.init(
                fontName,
                weight: .init(integer: font.weight),
                size: font.size,
                lineHeight: lineHeight,
                letter: letterSpacing,
                underline: false
            ))
            .foregroundColor(foregroundColor)
            .lineLimit(numberOfLines)
            .frame(maxWidth: .infinity, alignment: alignment.alignment)
            .multilineTextAlignment(alignment.textAlignment)
    }
}

// MARK: - Text

extension Text {

    /// Initialize with a `value` that is either markdown or plain text.
    /// - Warning: If the markdown can't be parsed the error is silently masked.
    /// - Parameters:
    ///   - value: String to render
    ///   - isMarkdown: Is the `value` markdown
    init(_ value: String, isMarkdown: Bool) {
        if isMarkdown, let markdown = try? AttributedString(markdown: value) {
            self.init(markdown)
        } else {
            self.init(verbatim: value)
        }
    }
}
