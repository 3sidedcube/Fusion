//
//  Button.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A `Text` with an `Action` and a disclosure chevron
public struct Button: Codable, JSONModel, ViewModel, TextProperties {

    /// `Action` on click
    public var action: ActionJSON?

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
