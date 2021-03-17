//
//  DividerContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `DividerView` subview.
open class DividerContainerView: ContainerView<DividerView> {

    /// `subview` where `subview` is a `DividerView`
    open var dividerView: DividerView {
        return subview
    }

    override open func setViewModel(_ viewModel: ViewModel?) {
        super.setViewModel(viewModel)

        // Overwrite `backgroundColor` to apply to the actual divider rather
        // than its container view. This doesn't quite follow the same
        // structure as the other view-models.
        // To correct, we would add a `color` property which would
        // apply to the divider and the `backgroundColor` would apply to the
        // divider container.
        let color = viewModel?.backgroundColor?.hexColor ?? .defaultBackgroundColor
        dividerView.backgroundColor = .defaultBackgroundColor
        dividerView.dividerView.backgroundColor = color
    }
}

/// Container of a `UIView` divider.
open class DividerView: UIView, Padded {

    /// Set the `Padding`
    open var padding: Padding {
        get {
            return Padding(insets: dividerViewEdgeConstraints.insets)
        }
        set {
            dividerViewEdgeConstraints.insets = newValue.insets
        }
    }

    /// Height of the `dividerView` (horizontally stroked line)
    open var strokeWidth: CGFloat {
        get {
            return dividerViewHeightConstraint.constant
        }
        set {
            dividerViewHeightConstraint.constant = newValue
        }
    }

    /// `UIView` divider
    public let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    /// `EdgeConstraints` of `dividerView`
    private var dividerViewEdgeConstraints: EdgeConstraints!

    /// `NSLayoutConstraint` of `dividerView` height
    private var dividerViewHeightConstraint: NSLayoutConstraint!

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
        addSubview(dividerView)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        dividerViewEdgeConstraints = dividerView.edgeConstraints(to: self)
        dividerViewHeightConstraint =
            dividerView.heightAnchor.constraint(equalToConstant: 0)
        dividerViewHeightConstraint.isActive = true
    }
}
