//
//  Image.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A remote image.
/// This structure is, in some ways, an abstraction of the `UIImageView`.
public struct Image: Codable {

    /// `String` remote URL location
    public var src: ImageSource?

    /// `RGBAHex` color to use for a placeholder while the remote image is being fetched
    public var placeholderColor: RGBAHex?

    /// `Padding` for text insets
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?
}

public extension Image {

    /// Map `src` to a `URL` instance
    var url: URL? {
        guard let src = src?.url else { return nil }
        return URL(string: src)
    }
}
