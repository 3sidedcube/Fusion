//
//  Image.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A remote image.
/// This structure is, in some ways, an abstraction of the `UIImageView`.
public struct Image: Codable, JSONModel {

    /// `String` remote URL location
    public var src: ImageSource?

    // MARK: - View

    /// RGBA hex color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for text insets
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

// MARK: - Extensions

public extension Image {

    /// Map `src` to a `URL` instance
    var url: URL? {
        guard let src = src?.url else { return nil }
        return URL(string: src)
    }
}
