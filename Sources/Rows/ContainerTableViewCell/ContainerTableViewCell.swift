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
/// Ideally we use generics here but unfortunately that doesn't work nicely with Objective-C!
class ContainerTableViewCell: SeparatorTableViewCell {

    /// Subclasses create the subview
    // swiftlint:disable unavailable_function
    class func createSubview() -> UIView {
        fatalError("Abstract: subclasses should override \(#function)")
    }
    // swiftlint:enable unavailable_function

    /// `UIView` subview
    private(set) var subview: UIView!

    /// `EdgeConstraints` of `subview` to `contentView`
    private var edgeConstraints: EdgeConstraints!

    // MARK: - Insets

    /// `UIEdgeInsets` of `edgeConstraints`
    var insets: UIEdgeInsets {
        get {
            return edgeConstraints.insets
        }
        set {
            edgeConstraints.insets = newValue
        }
    }

    // MARK: - Setup

    override func setup() {
        super.setup()

        addSubviews()
        addConstraints()
    }

    // MARK: - Subview

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        subview?.removeFromSuperview()
        subview = Self.createSubview()
        contentView.addSubview(subview)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        edgeConstraints = subview.edgeConstraints(to: contentView)
    }
}
