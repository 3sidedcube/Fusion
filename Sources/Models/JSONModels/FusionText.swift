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
    var textStyle: FusionTextStyle?
    var alignment: FusionTextAlignment?
    var lineLimit: Int?

    // MARK: - Computed

    var numberOfLines: Int? {
        guard let lineLimit else { return nil }
        return max(0, lineLimit)
    }

    var textAlignment: FusionTextAlignment {
        alignment ?? .default
    }

    // MARK: - View

    var body: some View {
        Text(value, isMarkdown: isMarkdown ?? false)
            .textStyle(textStyle)
            .foregroundColor(textColor?.color ?? .defaultTextColor)
            .lineLimit(numberOfLines)
            .multilineTextAlignment(textAlignment.textAlignment)
            .frame(maxWidth: .infinity, alignment: textAlignment.alignment)
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
