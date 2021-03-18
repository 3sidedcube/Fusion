//
//  ContainerTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import UIKit

/// A `UITableViewCell` which contains a custom `UIView` subview.
///
/// The subview hierarchy will look like this:
/// ```
/// - self (UITableViewCell)
///     - contentView
///         - CustomView
/// ```
///
/// - Note:
/// Ideally we use generics here (for `subview`) but unfortunately that doesn't work nicely with Objective-C
/// for ThunderTable using xib!
open class ContainerTableViewCell: SeparatorTableViewCell {

    // swiftlint:disable unavailable_function
    /// Subclasses create the subview
    open func createSubview() -> UIView {
        fatalError("Abstract: subclasses should override \(#function)")
    }
    // swiftlint:enable unavailable_function

    /// `UIView` subview
    public private(set) var subview: UIView!

    /// `EdgeConstraints` of `subview` to `contentView`
    private var edgeConstraints: EdgeConstraints!

    // MARK: - Insets

    /// `UIEdgeInsets` of `edgeConstraints`
    open var insets: UIEdgeInsets {
        get {
            return edgeConstraints.insets
        }
        set {
            edgeConstraints.insets = newValue
        }
    }

    // MARK: - Setup

    override open func setup() {
        super.setup()

        addSubviews()
        addConstraints()
    }

    // MARK: - Subview

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        subview = createSubview()
        contentView.addSubview(subview)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        edgeConstraints = subview.edgeConstraints(to: contentView)

        // Silence `UIView-Encapsulated-Layout-Height` warnings
        edgeConstraints.bottom.priority = .init(999)
    }

    // MARK: - Lifecycle

    override open func awakeFromNib() {
        super.awakeFromNib()

        updateHighlighted(animated: false)
        selectedBackgroundView = UIView()
    }
}
