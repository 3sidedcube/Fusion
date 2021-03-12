//
//  ContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

/// A container `UIView` with a single subview.
///
/// This enables conformance to `Insettable` where the subview handles the `Padding` and
/// this `ContainerView` handles the `Margins`.
class ContainerView<T>: HighlightableView, Insettable where T: UIView, T: Padded {

    /// Create the `subview` of type `T`
    func createSubview() -> T {
        return T()
    }

    /// Get and set `Padding` on `subview`
    var padding: Padding {
        get {
            return subview.padding
        }
        set {
            subview.padding = newValue
        }
    }

    /// Get and set `Margins` by setting the `UIEdgeInsets` on `edgeConstraints`
    var margins: Margins {
        get {
            return Margins(insets: edgeConstraints.insets)
        }
        set {
            edgeConstraints.insets = newValue.insets
        }
    }

    /// Subview of type `T`
    private(set) lazy var subview = createSubview()

    /// `EdgeConstraints` of `subview` to `self`
    private(set) var edgeConstraints: EdgeConstraints!

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

    func setup() {
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
    func setViewModel(_ viewModel: ViewModel?) {
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
}
