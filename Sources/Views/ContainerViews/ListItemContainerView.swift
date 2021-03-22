//
//  ListItemContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `ListItemView` subview.
open class ListItemContainerView: ContainerView<ListItemView> {

    open var listItemView: ListItemView {
        return subview
    }
}

/// List item `UIView` cell structure
open class ListItemView: HighlightableView, Padded {

    /// `Padding` of `hStackViewEdgeConstraints`
    open var padding: Padding {
        get {
            return Padding(insets: hStackViewEdgeConstraints.insets)
        }
        set {
            hStackViewEdgeConstraints.insets = newValue.insets
        }
    }

    /// `UIStackView` for `imageContainerView` and `vStackView`
    public private(set) lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    /// `ImageContainerView` for image
    public private(set) lazy var imageContainerView = ImageContainerView()

    /// `subview` of `imageContainerView`
    public var imageView: UIImageView {
        return imageContainerView.subview.imageView
    }

    /// `ImageContainerView` for accessory image
    public private(set) lazy var accessoryContainerView = ImageContainerView()

    /// `subview` of `accessoryContainerView`
    public var accessoryImageView: UIImageView {
        return accessoryContainerView.subview.imageView
    }

    /// `UIStackView` for `titleLabelContainerView` and `subtitleLabelContainerView`
    public private(set) lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()

    /// `LabelContainerView` for title
    public private(set) lazy var titleLabelContainerView = LabelContainerView()

    /// `subview` of `titleLabelContainerView`
    public var titleLabel: UILabel {
        return titleLabelContainerView.subview
    }

    /// `LabelContainerView` for subtitle
    public private(set) lazy var subtitleLabelContainerView = LabelContainerView()

    /// `subview` of `subtitleLabelContainerView`
    public var subtitleLabel: UILabel {
        return subtitleLabelContainerView.subview
    }

    /// `EdgeConstraints` of the `hStackView`
    private var hStackViewEdgeConstraints: EdgeConstraints!

    /// `titleLabel` and `subtitleLabel`
    public var labels: [UILabel] {
        return [titleLabel, subtitleLabel]
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

        // `imageView`
        imageView.contentMode = .scaleAspectFit

        // `accessoryImageView`
        accessoryImageView.backgroundColor = .clear
        accessoryImageView.contentMode = .scaleAspectFit
        accessoryImageView.isHidden = true

        // `hStackView`
        hStackView.setCustomSpacing(.defaultAccessorySpacing, after: vStackView)
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
        hStackView.addArrangedSubview(accessoryImageView)

        // `self`
        addSubview(hStackView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        // `hStackViewEdgeConstraints`
        hStackViewEdgeConstraints = hStackView.edgeConstraints(to: self)

        // `titleLabel`
        titleLabel.setContent(
            hugging: 250,
            compressionResistance: 1000, // Never squash vertically
            axis: [.vertical]
        )

        // `subtitleLabel`
        subtitleLabel.setContent(
            hugging: 249, // Prefer to be stretched than `titleLabel`
            compressionResistance: 1000, // Never squash vertically
            axis: [.vertical]
        )

        // `accessoryImageView`
        accessoryImageView.setContent(
            hugging: 900,
            compressionResistance: 900,
            axis: [.horizontal]
        )
        accessoryImageView.setContent(
            hugging: 900,
            compressionResistance: 1000, // Never squash vertically
            axis: [.vertical]
        )

        // `imageView`
        imageView.setContent(
            hugging: 800,
            compressionResistance: 1000, // Never squash horizontally
            axis: [.horizontal]
        )
        imageView.setContent(
            hugging: 800,
            compressionResistance: 1000, // Never squash vertically
            axis: [.vertical]
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
