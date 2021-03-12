//
//  ListItemContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `ListItemView` subview.
class ListItemContainerView: ContainerView<ListItemView> {

    var listItemView: ListItemView {
        return subview
    }
}

/// List item `UIView` cell structure
class ListItemView: HighlightableView, Padded {

    /// `Padding` of `hStackViewEdgeConstraints`
    var padding: Padding {
        get {
            return Padding(insets: hStackViewEdgeConstraints.insets)
        }
        set {
            hStackViewEdgeConstraints.insets = newValue.insets
        }
    }

    /// `UIStackView` for `imageContainerView` and `vStackView`
    private(set) lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    /// `ImageContainerView` for image
    private(set) lazy var imageContainerView = ImageContainerView()

    /// `UIStackView` for `titleLabelContainerView` and `subtitleLabelContainerView`
    private(set) lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()

    /// `LabelContainerView` for title
    private(set) lazy var titleLabelContainerView = LabelContainerView()

    /// `subview` of `titleLabelContainerView`
    var titleLabel: UILabel {
        return titleLabelContainerView.subview
    }

    /// `LabelContainerView` for subtitle
    private(set) lazy var subtitleLabelContainerView = LabelContainerView()

    /// `subview` of `subtitleLabelContainerView`
    var subtitleLabel: UILabel {
        return subtitleLabelContainerView.subview
    }

    /// `EdgeConstraints` of the `hStackView`
    private var hStackViewEdgeConstraints: EdgeConstraints!

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

        // Remove auto-resizing of `imageView` based on image size
        imageContainerView.imageView.isResizingEnabled = false
        imageContainerView.imageView.contentMode = .scaleAspectFit
    }

    // MARK: - Subviews and Constraints

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        // `vStackView`
        vStackView.addArrangedSubview(titleLabelContainerView)
        vStackView.addArrangedSubview(subtitleLabelContainerView)

        // `hStackView`
        hStackView.addArrangedSubview(imageContainerView)
        hStackView.addArrangedSubview(vStackView)

        // `self`
        addSubview(hStackView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        // `hStackViewEdgeConstraints`
        hStackViewEdgeConstraints = hStackView.edgeConstraints(to: self)

        // `imageView`
        let imageView = imageContainerView.imageView
        imageView.setContent(
            hugging: 800,
            compressionResistance: 800,
            axis: [.vertical, .horizontal]
        )

        imageView.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = imageView.widthAnchor.constraint(
            lessThanOrEqualToConstant: .defaultViewImageMaxWidth
        )
        let heightConstraint = imageView.heightAnchor.constraint(
            lessThanOrEqualToConstant: .defaultViewImageMaxHeight
        )

        // Set constraint not-required in case the properties force a fixed width
        // and height greater than this value
        widthConstraint.priority = .init(999)
        heightConstraint.priority = .init(999)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint])
    }
}
