//
//  Text.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Define the properties to draw text.
/// This structure is, in some ways, an abstraction of the `UITextView` or `UILabel`
public struct Text: Codable {

    /// Text `String`
    public var text: String?

    /// RGBA hex color for the background
    public var backgroundColor: String?

    /// RGBA hex color for the text
    public var textColor: String?

    /// `Font` style of the text
    public var font: Font?

    /// `TextAlignment`
    public var textAlignment: TextAlignment?

    /// Number of lines to show this text in
    public var numberOfLines: Int?

    /// Height of the line
    public var lineHeight: Float?

    /// Letter spacing
    public var letterSpacing: Float?

    /// `Padding` for text insets
    public var padding: Padding?
}
