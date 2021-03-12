//
//  Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A structure used as a spacer or divider.
public struct Divider: Codable, JSONModel, ViewModel {

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

    /// Total height including `strokeWidth`, `padding`, `margin`
    var height: Float {
        let paddingHeight = padding?.insets.verticalSum.float ?? 0
        let marginsHeight = margin?.insets.verticalSum.float ?? 0
        let strokeWidth = self.strokeWidth ?? 0
        return max(0, strokeWidth + paddingHeight + marginsHeight)
    }
}
