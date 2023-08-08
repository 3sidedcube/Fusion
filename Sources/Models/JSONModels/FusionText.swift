//
//  FusionText.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `Text`
struct FusionText: FusionModel {

    var value: String
    var isMarkdown: Bool?
    var textColor: RGBAHex?
    var textStyle: FusionTextStyle?
    var alignment: FusionAlignment?
    var lineLimit: Int?

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?
    var onTap: ActionJSON?

    // MARK: - Computed

    private var numberOfLines: Int? {
        guard let lineLimit else { return nil }
        return max(0, lineLimit)
    }

    // MARK: - View

    var body: some View {
        Text(value, isMarkdown: isMarkdown ?? .defaultIsMarkdown)
            .textStyle(textStyle)
            .foregroundColor(Color(hex: textColor) ?? .defaultTextColor)
            .lineLimit(numberOfLines)
            .multilineTextAlignment((alignment ?? .default).textAlignment)
            .frame(frame?.alignment(alignment))
            .view(self)
    }
}

// MARK: - Text + Extensions

extension Text {

    /// Initialize with a `value` that is either markdown or plain text.
    /// - Parameters:
    ///   - value: String to render
    ///   - isMarkdown: Is the `value` markdown
    @MainActor init(_ value: String, isMarkdown: Bool) {
        guard isMarkdown else {
            self.init(verbatim: value)
            return
        }

        do {
            try self.init(AttributedString(markdown: value))
        } catch {
            Fusion.shared.log("Failed to load markdown: \(error)")
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
