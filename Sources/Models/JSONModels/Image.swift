//
//  Image.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A remote image.
/// This structure is, in some ways, an abstraction of the `UIImageView`.
public struct Image: Codable, JSONModel, ViewModel {

    /// `Entry` where the image is located
    public var src: Entry? {
        didSet {
            remoteImage = createRemoteImage()
        }
    }

    /// Define a fixed width and/or height to enforce on the image.
    /// If `nil`, then dynamically size the `UIImageView` from the `size` of the `UIImage`.
    public var fixedSize: Size?

    // MARK: - View

    /// `RGBAHex` for the background
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

    // MARK: - RemoteImage

    /// `RemoteImage` from `src`
    lazy var remoteImage = createRemoteImage()

    /// Create a `RemoteImage` from the `src`
    private func createRemoteImage() -> RemoteImage? {
        guard let url = url else { return nil }
        return RemoteImage(url: url)
    }
}

// MARK: - Extensions

public extension Image {

    /// Map `src` to a `URL` instance
    var url: URL? {
        guard let src = src?.url else { return nil }
        return URL(string: src)
    }
}
