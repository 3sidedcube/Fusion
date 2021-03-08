//
//  Button.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A `Text` with an `Action` and a disclosure chevron
public struct Button: Codable, JSONModel {

    /// `Text` to define styling
    public var text: Text?

    /// `Action` on click
    public var action: ActionJSON?

    // MARK: - View

    /// RGBA hex color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for insets of own content
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Border` of the container
    public var border: Border?
}
