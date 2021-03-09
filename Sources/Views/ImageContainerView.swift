//
//  ImageContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// Container of a `UIImageView` which can load `UIImage`s from a remote `URL`
class ImageContainerView: UIView, Insettable {

    /// Set the `UIEdgeInsets` of `imageViewEdgeConstraints`
    var imageViewInsets: UIEdgeInsets {
        get {
            return imageViewEdgeConstraints.insets
        }
        set {
            imageViewEdgeConstraints.insets = newValue
        }
    }

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

    // MARK: Insettable

    func setInsets(_ insets: UIEdgeInsets) {
        imageViewInsets = insets
    }
}
