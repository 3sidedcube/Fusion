//
//  AdjustableImageView.swift
//  CBIT
//
//  Created by Ben Shutt on 20/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `AdjustableImageView` is a `UIImageView` which should have a fixed width.
/// Upon setting `image`, that `UIImage` will be resized such that:
/// - It's `size.width` matches `bounds.width`
/// - It's `size.height` is such that the `UIImage` maintains it's aspect ratio with its new `size.width`.
class AdjustableImageView: UIImageView {

    /// Perform `image` resizing on `bounds` change and setting `image`
    var isResizingEnabled = true

    // MARK: - Image

    /// Override `image` resizing if necessary on set
    override var image: UIImage? {
        get {
            return super.image
        }
        set {
            super.image = resizeImage(newValue)
        }
    }

    // MARK: - Init

    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    /// Shared initializer code
    private func setup() {
        // Set default `contentMode`
        contentMode = .scaleAspectFill
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        resizeImage() // performance?
    }

    // MARK: - Resize

    /// Set `image` to the resized version of `image`
    private func resizeImage() {
        image = resizeImage(image)
    }

    /// Resize the given image based on `bounds`
    ///
    /// - Parameter image: `UIImage`
    private func resizeImage(_ image: UIImage?) -> UIImage? {
        guard isResizingEnabled else { return image }
        guard let image = image else { return nil }

        // `image` dimensions
        let imageWidth = image.size.width
        let imageHeight = image.size.height

        // `image` aspectRatio
        guard imageHeight > 0 else { return image }
        let aspectRatio = imageWidth / imageHeight
        guard aspectRatio > 0 else { return image }

        // `self` dimensions
        let width = bounds.size.width

        // Target dimensions
        let targetWidth = width
        let targetHeight = targetWidth / aspectRatio

        // Check if we need to resize at all
        let widthIsEqual = CGFloat.isEqual(
            imageWidth, targetWidth, epsilon: .largeEpsilon
        )
        let heightIsEqual = CGFloat.isEqual(
            imageHeight, targetHeight, epsilon: .largeEpsilon
        )
        guard !widthIsEqual || !heightIsEqual else { return image }

        // Perform resize
        return image.resizeImage(
            to: CGSize(width: targetWidth, height: targetHeight)
        )
    }
}

// MARK: - CGFloat + Equal

extension CGFloat {

    /// Large epsilon value (i.e. doesn't require a lot of precision)
    fileprivate static let largeEpsilon: CGFloat = 0.001

    /// Are `a` and `b` equal within `epsilon`
    ///
    /// - Parameters:
    ///   - a: `CGFloat`
    ///   - b: `CGFloat`
    ///   - epsilon: `CGFloat`
    static func isEqual(
        _ a: CGFloat,
        _ b: CGFloat,
        epsilon: CGFloat = .ulpOfOne
    ) -> Bool {
        return abs(a - b) < epsilon
    }
}
