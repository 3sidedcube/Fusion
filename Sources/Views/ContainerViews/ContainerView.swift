//
//  ContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

/// A container `UIView` with a single subview which can be inset to support `margins` (on the subview).
///
/// This enables conformance to `Insettable` where the subview handles the `Padding` and
/// this `ContainerView` handles the `Margins`.
open class ContainerView<T>: UIView, Insettable where T: UIView, T: Padded {

    /// Create the `subview` of type `T`.
    ///
    /// Called when `subview` is first lazily instantiated.
    open func createSubview() -> T {
        return T()
    }

    /// Get and set `Padding` on `subview` which is `Padded`
    open var padding: Padding {
        get {
            return subview.padding
        }
        set {
            subview.padding = newValue
        }
    }

    /// Get and set `Margins` by setting the `UIEdgeInsets` on `edgeConstraints`
    open var margins: Margins {
        get {
            return Margins(insets: edgeConstraints.insets)
        }
        set {
            edgeConstraints.insets = newValue.insets
            invalidateIntrinsicContentSize()
        }
    }

    /// Subview of type `T`
    private(set) lazy var subview = createSubview()

    /// `EdgeConstraints` of `subview` to `self`
    private var edgeConstraints: EdgeConstraints!

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

    open func setup() {
        backgroundColor = .clear

        addSubviews()
        addConstraints()
    }

    // MARK: - Subviews and Constraints

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        addSubview(subview)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        edgeConstraints = subview.edgeConstraints(to: self)
    }

    // MARK: - ViewModel

    /// Set the `viewModel`.
    ///
    /// Properties will mostly be set on the `subview`.
    /// `margin`s will be set on this `ContainerView` instance as that defines the
    /// insets of the `subview` relative to `self`. Which ultimately is the purpose of this class.
    ///
    /// - Parameter viewModel: `ViewModel`
    open func setViewModel(_ viewModel: ViewModel?) {
        // `backgroundColor`
        let backgroundColor = viewModel?.backgroundColor?.hexColor
        subview.backgroundColor = backgroundColor ?? .defaultBackgroundColor

        // `padding`
        padding = viewModel?.padding ?? .zero

        // `margin`
        margins = viewModel?.margin ?? .zero

        // `border`
        subview.layer.setBorder(viewModel?.border)

        // `shadow`
        subview.layer.setShadow(viewModel?.shadow)

        // `cornerRadius`
        subview.layer.setCornerRadius(viewModel?.cornerRadius)
    }

    // MARK: - IntrinsicContentSize

    /// Append `margins` to `intrinsicContentSize` of `subview`
    ///
    /// - Note:
    /// `padding` should be handled in the `intrinsicContentSize` of the subview as `padding`
    /// refers to inset of own content
    override open var intrinsicContentSize: CGSize {
        let intrinsicContentSize = subview.intrinsicContentSize
        var width = intrinsicContentSize.width
        if width >= 0 {
            width += margins.insets.horizontalSum
        }

        var height = intrinsicContentSize.height
        if height >= 0 {
            height += margins.insets.verticalSum
        }

        return CGSize(width: width, height: height)
    }
}
