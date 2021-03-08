//
//  Container.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// Structure which contains other content
public class View: Codable {

    /// Background `RGBAHex` color
    public var backgroundColor: RGBAHex?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// `Padding` for text insets
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?

    /// `Border` of the container
    public var border: Border?
}
