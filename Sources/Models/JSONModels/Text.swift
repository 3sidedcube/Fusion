//
//  Text.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Define the properties to draw text.
/// This structure is, in some ways, an abstraction of the `UITextView` or `UILabel`.
public struct Text: Codable, JSONModel, ViewModel {

    /// Text `String`
    public var content: String?

    /// RGBA hex color for the text
    public var textColor: RGBAHex?

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

    // MARK: - View

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
