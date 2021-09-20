//
//  ImageModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A remote image.
/// This structure is, in some ways, an abstraction of the `UIImageView`.
///
/// - Note:
/// This structure is essentially the model to drive a SwiftUI `Image`
public struct ImageModel: Codable, JSONModel, ViewModel {

    /// `Entry` where the image is located
    public var src: EntryModel?

    /// Define a fixed width and/or height to enforce on the image.
    /// If `nil`, then dynamically resize based on the image content
    public var fixedSize: SizeModel?

    // MARK: - ViewModel

    /// `RGBAHex` background color
    public var backgroundColor: RGBAHex?

    /// `InsetsModel` padding insets
    public var padding: InsetsModel?

    /// `InsetsModel` margin insets
    public var margin: InsetsModel?

    /// `BorderModel`
    public var border: BorderModel?

    /// `ShadowModel`
    public var shadow: ShadowModel?

    /// `Points` of corner radius
    public var cornerRadius: Points?
}

// MARK: - Extensions

public extension ImageModel {

    /// Map `src` to a `URL` instance
    var url: URL? {
        guard let src = src?.url else { return nil }
        return URL(string: src)
    }
}
