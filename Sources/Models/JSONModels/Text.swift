//
//  Text.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Define the properties to draw text.
/// This structure is, in some ways, an abstraction of the `UITextView` or `UILabel`.
public struct Text: Codable, JSONModel, ViewModel, TextProperties {

    // MARK: - TextProperties

    /// `String` text
    public var content: String?

    /// `RGBAHex` color of the text
    public var textColor: RGBAHex?

    /// `Font` of the text
    public var font: Font?

    /// `TextAlignment` to position text
    public var textAlignment: TextAlignment?

    /// Number of lines of text to draw
    public var numberOfLines: Int?

    /// Height of each line
    public var lineHeight: Float?

    /// Letter spacing between characters
    public var letterSpacing: Float?

    // MARK: - ViewModel

    /// `RGBAHex` color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for content insets
    public var padding: Padding?

    /// `Margin` for insets relative to other views
    public var margin: Margins?

    /// `Border` of the container
    public var border: Border?

    /// `Shadow` of the container
    public var shadow: Shadow?

    /// Corner radius of the container
    public var cornerRadius: Float?
}
