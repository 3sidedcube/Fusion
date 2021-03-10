//
//  ImageContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// Container of a `UIImageView` which can load `UIImage`s from a remote `URL`.
///
/// For Android compatibility, this `UIView` can set both
/// - `padding` (inset of own content)
/// - `margin` (inset relative to other views)
class ImageContainerView: UIView, Insettable {

    /// Set the `UIEdgeInsets` of `imageContainerViewEdgeConstraints`
    var margin: UIEdgeInsets {
        get {
            return imageContainerViewEdgeConstraints.insets
        }
        set {
            imageContainerViewEdgeConstraints.insets = newValue
        }
    }

    /// Set the `UIEdgeInsets` of `imageViewEdgeConstraints`
    var padding: UIEdgeInsets {
        get {
            return imageViewEdgeConstraints.insets
        }
        set {
            imageViewEdgeConstraints.insets = newValue
        }
    }

    /// `UIView` container of `imageView`
    let imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    /// `AdjustableImageView` to draw `UIImage`
    let imageView: AdjustableImageView = {
        let imageView = AdjustableImageView(image: nil)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    /// `EdgeConstraints` of `imageContainerView`
    private(set) var imageContainerViewEdgeConstraints: EdgeConstraints!

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
        imageContainerView.addSubview(imageView)
        addSubview(imageContainerView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        imageContainerViewEdgeConstraints = imageContainerView.edgeConstraints(to: self)
        imageViewEdgeConstraints = imageView.edgeConstraints(to: imageContainerView)
    }

    // MARK: Insettable

    func setInsets(_ insets: UIEdgeInsets) {
        padding = insets
    }
}
