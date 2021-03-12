//
//  ImageContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `InsetLabel` subview.
class ImageContainerView: ContainerView<PaddedImageView> {

    var imageView: AdjustableImageView {
        return subview.imageView
    }
}

// MARK: - PaddedImageView

/// `UIView` wrapping a `UIImageView` to support `Padding`
class PaddedImageView: UIView, Padded {

    /// `AdjustableImageView` to draw `UIImage`
    let imageView: AdjustableImageView = {
        let imageView = AdjustableImageView(image: nil)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    /// `EdgeConstraints` of `imageView`
    private(set) var imageViewEdgeConstraints: EdgeConstraints!

    /// `NSLayoutConstraint` to fix the `imageView` width
    private(set) var imageViewWidthConstraint: NSLayoutConstraint?

    /// `NSLayoutConstraint` to fix the `imageView` height
    private(set) var imageViewHeightConstraint: NSLayoutConstraint?

    /// Fixed a `CGSize` for the `imageView`.
    var fixedSize: Size? {
        get {
            return getFixedSize()
        }
        set {
            setFixedSize(newValue)
        }
    }

    // MARK: - Init

    convenience init() {
        self.init(frame: .zero)
    }

    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
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
    }

    // MARK: - Padded

    var padding: Padding {
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
