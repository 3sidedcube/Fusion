//
//  DefaultView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

/// Default `UIView` cell structure
class DefaultView: UIView, Insettable {

    /// Set the `UIEdgeInsets` of `containerViewEdgeConstraints`
    var margin: UIEdgeInsets {
        get {
            return containerViewEdgeConstraints.insets
        }
        set {
            containerViewEdgeConstraints.insets = newValue
        }
    }

    /// Set the `UIEdgeInsets` of `verticalStackViewEdgeConstraints`
    var padding: UIEdgeInsets {
        get {
            return verticalStackViewEdgeConstraints.insets
        }
        set {
            verticalStackViewEdgeConstraints.insets = newValue
        }
    }

    /// Container `UIView` for other subview content
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    /// `UIStackView` in `containerView` for `imageContainerView` and `verticalStackView`
    private(set) lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 5
        return stackView
    }()

    /// `ImageContainerView` for image
    private(set) lazy var imageContainerView = ImageContainerView()

    /// `UIStackView` for `titleLabelContainerView` and `subtitleLabelContainerView`
    private(set) lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()

    /// `LabelContainerView` for title
    private(set) lazy var titleLabelContainerView = LabelContainerView()

    /// `LabelContainerView` for subtitle
    private(set) lazy var subtitleLabelContainerView = LabelContainerView()

    /// `EdgeConstraints` of the `verticalStackView`
    private var verticalStackViewEdgeConstraints: EdgeConstraints!

    /// `EdgeConstraints` of the `containerView`
    private var containerViewEdgeConstraints: EdgeConstraints!

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
        // `verticalStackView`
        verticalStackView.addArrangedSubview(titleLabelContainerView)
        verticalStackView.addArrangedSubview(subtitleLabelContainerView)

        // `horizontalStackView`
        horizontalStackView.addArrangedSubview(imageContainerView)
        horizontalStackView.addArrangedSubview(verticalStackView)

        // `containerView`
        containerView.addSubview(horizontalStackView)

        // `self`
        addSubview(containerView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        containerViewEdgeConstraints = containerView.edgeConstraints(to: self)
        verticalStackViewEdgeConstraints =
            verticalStackView.edgeConstraints(to: containerView)
    }

    // MARK: Insettable

    func setInsets(_ insets: UIEdgeInsets) {
        margin = insets
    }
}
