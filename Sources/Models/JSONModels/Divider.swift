//
//  Divider.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A structure with merely a background color and a fixed height
public struct Divider {

    /// `RGBAHex` color of the divider
    public var dividerColor: RGBAHex?

    /// `Float` height of the divider
    public var dividerHeight: Float?

    /// `Padding` for divider insets
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?
}
