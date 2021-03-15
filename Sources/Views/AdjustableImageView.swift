//
//  AdjustableImageView.swift
//  CBIT
//
//  Created by Ben Shutt on 20/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `AdjustableImageView` is a `UIImageView` which should have a fixed width or height.
/// It will add an `NSLayoutConstraint` such that it's width/height (aspect) ratio matches the
/// `image` width/height ratio.
open class AdjustableImageView: UIImageView {

    /// When `true`, add an `NSLayoutConstraint` to this `UIImageView` so that
    /// it's width/height (aspect) ratio matches that of the `image`
    open var isResizingEnabled = true {
        didSet {
            updateAspectRatioConstraint()
        }
    }

    /// Override `image` setting constraint if necessary on set
    override open var image: UIImage? {
        didSet {
            updateAspectRatioConstraint()
        }
    }

    /// `NSLayoutConstraint` constraining `heightAnchor` relative to the `widthAnchor`
    /// with the same `multiplier` as the inverse of the `image` aspect ratio, where aspect
    /// ratio is defined width/height.
    private var aspectRatioConstraint: NSLayoutConstraint?

    // MARK: - Init

    override public init(image: UIImage?) {
        super.init(image: image)
        setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    /// Shared initializer code
    private func setup() {
        // Set default `contentMode`
        contentMode = .scaleAspectFill

        // Update constraints
        updateAspectRatioConstraint()
    }

    // MARK: - Resize

    /// De-active `aspectRatioConstraint` and re-active if conditions are met
    private func updateAspectRatioConstraint() {
        // De-active old constraint
        aspectRatioConstraint?.isActive = false

        // Check that we have an image and resizing is enabled
        guard let image = image, isResizingEnabled else { return }

        // `image` dimensions
        let imageWidth = image.size.width
        let imageHeight = image.size.height

        // `image` aspectRatio
        guard imageWidth > 0 else { return }
        let aspectRatio = imageHeight / imageWidth
        guard aspectRatio > 0 else { return }

        // Create a new constraint
        aspectRatioConstraint = heightAnchor.constraint(
            equalTo: widthAnchor,
            multiplier: aspectRatio
        )
        // Setting both a fixed width AND height should override this
        aspectRatioConstraint?.priority = .init(999)

        // Activate new constraint
        aspectRatioConstraint?.isActive = true
    }
}
