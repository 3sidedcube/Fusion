//
//  FusionText.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionText: FusionModel, View {

    var value: String
    var isMarkdown: Bool?
    var textColor: RGBAHex?
    var textStyle: FusionTextStyle?
    var alignment: FusionAlignment?
    var lineLimit: Int?

    // MARK: View

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?

    // MARK: - Computed

    private var numberOfLines: Int? {
        guard let lineLimit else { return nil }
        return max(0, lineLimit)
    }

    // MARK: - View

    var body: some View {
        Text(value, isMarkdown: isMarkdown ?? false)
            .textStyle(textStyle)
            .foregroundColor(textColor?.color ?? .defaultTextColor)
            .lineLimit(numberOfLines)
            .multilineTextAlignment((alignment ?? .default).textAlignment)
            .frame(frame?.alignment(alignment))
            .view(self)
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

// MARK: - PreviewProvider

struct FusionText_Previews: PreviewProvider {
    static var previews: some View {
        FusionText.preview(from: "Text")
    }
}
