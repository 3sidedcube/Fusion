//
//  Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A structure used as a spacer or divider.
public struct Divider: Codable, JSONModel {

    /// `RGBAHex` color of the divider
    public var color: RGBAHex?

    /// `Float` height of the divider
    public var strokeWidth: Float?

    // MARK: - View

    /// `Margin` for insets relative to other content
    public var margin: Margin?

    // `backgroundColor` not supported

    // `padding` not supported

    // `shadow` not supported

    // `cornerRadius` not supported

    // `border` not supported
}
