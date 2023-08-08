//
//  FusionText.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `Text`
public struct FusionText: FusionModel {

    public var value: String
    public var isMarkdown: Bool?
    public var textColor: RGBAHex?
    public var textStyle: FusionTextStyle?
    public var alignment: FusionAlignment?
    public var lineLimit: Int?

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON?

    // MARK: - Init

    public init(
        value: String,
        isMarkdown: Bool? = nil,
        textColor: RGBAHex? = nil,
        textStyle: FusionTextStyle? = nil,
        alignment: FusionAlignment? = nil,
        lineLimit: Int? = nil,
        padding: FusionPadding? = nil,
        backgroundColor: RGBAHex? = nil,
        frame: FusionFrame? = nil,
        cornerRadius: CGFloat? = nil,
        border: FusionBorder? = nil,
        shadow: FusionShadow? = nil,
        margins: FusionPadding? = nil,
        onTap: ActionJSON? = nil
    ) {
        self.value = value
        self.isMarkdown = isMarkdown
        self.textColor = textColor
        self.textStyle = textStyle
        self.alignment = alignment
        self.lineLimit = lineLimit
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.border = border
        self.shadow = shadow
        self.margins = margins
        self.onTap = onTap
    }

    // MARK: - Computed

    private var numberOfLines: Int? {
        guard let lineLimit else { return nil }
        return max(0, lineLimit)
    }

    // MARK: - View

    public var body: some View {
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

private extension Text {

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
