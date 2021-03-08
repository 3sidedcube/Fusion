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
    public var src: String?

    /// `Float` width of the image
    public var width: Float?

    /// `Float` height of the image
    public var height: Float?
}

public extension Image {

    /// Map `src` to a `URL` instance
    var url: URL? {
        guard let src = src else { return nil }
        return URL(string: src)
    }
}
