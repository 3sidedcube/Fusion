//
//  FusionText.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionText: Model, View {

    var value: String
    var isMarkdown: Bool?
    var textColor: RGBAHex?
    var font: FusionFont?
    var alignment: FusionTextAlignment?
    var lineHeight: Px
    var letterSpacing: Px
    var lineLimit: Int?

    // MARK: - Computed

    var textAlignment: FusionTextAlignment {
        alignment ?? .default
    }

    var foregroundColor: Color {
        guard let textColor else { return .defaultTextColor }
        return Color(hexString: textColor) ?? .defaultTextColor
    }

    // MARK: - View

    var body: some View {
        Text(value, isMarkdown: isMarkdown ?? false)
            .style(.init(
                font?.fontName ?? .default,
                weight: .init(integer: font?.weight ?? .defaultFontWeight),
                size: font?.size ?? .defaultFontSize,
                lineHeight: lineHeight,
                letter: letterSpacing,
                underline: false
            ))
            .foregroundColor(foregroundColor)
            .lineLimit(lineLimit)
            .frame(maxWidth: .infinity, alignment: textAlignment.alignment)
            .multilineTextAlignment(textAlignment.textAlignment)
    }
}

// MARK: - Text + Extensions

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
