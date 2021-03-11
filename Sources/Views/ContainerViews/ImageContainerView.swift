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

    var imageView: UIImageView {
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
}
