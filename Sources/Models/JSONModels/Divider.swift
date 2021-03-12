//
//  Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A structure used as a spacer or divider.
public struct Divider: Codable, JSONModel, ViewModel {

    /// `RGBAHex` color of the divider
    public var color: RGBAHex?

    /// `Float` height of the divider
    public var strokeWidth: Float?

    // MARK: - View

    /// `RGBAHex` color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for insets of own content
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margins?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Border` of the container view
    public var border: Border?
}

extension Divider {

    /// Total height including `margin` and `strokeWidth`
    var totalHeight: Float {
        let margin = (self.margin?.insets ?? .zero).verticalSum
        let strokeWidth = self.strokeWidth ?? 0
        return max(0, Float(margin) + strokeWidth)
    }
}
