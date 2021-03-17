//
//  ImageContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `PaddedImageView` subview.
open class ImageContainerView: ContainerView<PaddedImageView> {

    open var paddedImageView: PaddedImageView {
        return subview
    }

    open var imageView: AdjustableImageView {
        return paddedImageView.imageView
    }
}

// MARK: - PaddedImageView

/// `UIView` wrapping a `UIImageView` to support `Padding`
open class PaddedImageView: UIView, Padded {

    /// `AdjustableImageView` to draw `UIImage`
    public let imageView: AdjustableImageView = {
        let imageView = AdjustableImageView(image: nil)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .placeholder
        return imageView
    }()

    /// `EdgeConstraints` of `imageView`
    private var imageViewEdgeConstraints: EdgeConstraints!

    /// `NSLayoutConstraint` to fix the `imageView` width
    private var imageViewWidthConstraint: NSLayoutConstraint?

    /// `NSLayoutConstraint` to fix the `imageView` height
    private var imageViewHeightConstraint: NSLayoutConstraint?

    /// Fixed a `CGSize` for the `imageView`.
    open var fixedSize: Size? {
        get {
            return getFixedSize()
        }
        set {
            setFixedSize(newValue)
        }
    }

    // MARK: - Init

    public convenience init() {
        self.init(frame: .zero)
    }

    override public init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Shared initializer functionality
    private func setup() {
        backgroundColor = .clear

        addSubviews()
        addConstraints()
    }

    // MARK: - Subviews and Constraints

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        addSubview(imageView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        imageViewEdgeConstraints = imageView.edgeConstraints(to: self)

        // Add a default height constraint of 0 on the imageView for
        // when there's no image. This is to prevent there to ensure there are
        // enough constraints in the cell for Auto Layout to inform the tableview
        // of the height of the cell
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.priority = .init(150)
        heightConstraint.isActive = true
    }

    // MARK: - Padded

    open var padding: Padding {
        get {
            return Padding(insets: imageViewEdgeConstraints.insets)
        }
        set {
            imageViewEdgeConstraints.insets = newValue.insets
        }
    }

    // MARK: - ImageSize

    /// Configure `imageView` constraints according to the given `size`
    ///
    /// - Parameter size: `Size`
    private func setFixedSize(_ size: Size?) {
        imageViewWidthConstraint?.isActive = false
        imageViewHeightConstraint?.isActive = false

        // Set width
        if let width = size?.width {
            let imageWidth = max(0, width.cgFloat)
            imageViewWidthConstraint = imageView.widthAnchor.constraint(
                equalToConstant: imageWidth
            )
            imageViewWidthConstraint?.isActive = true
        }

        // Set height
        if let height = size?.height {
            let imageHeight = max(0, height.cgFloat)
            imageViewHeightConstraint = imageView.heightAnchor.constraint(
                equalToConstant: imageHeight
            )
            imageViewHeightConstraint?.isActive = true
        }
    }

    /// `Size` from `imageView` constraints
    private func getFixedSize() -> Size {
        return Size(
            width: imageViewWidthConstraint?.constant.float,
            height: imageViewHeightConstraint?.constant.float
        )
    }
}
