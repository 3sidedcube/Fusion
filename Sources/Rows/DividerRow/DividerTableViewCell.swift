//
//  DividerTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import UIKit

/// A `UITableViewCell` which can be used, from a UI point of view, to divide or separate
/// other `UITableViewCell`
class DividerTableViewCell: UITableViewCell {

    /// `UIView` used to draw a divider
    @IBOutlet private(set) var dividerView: UIView!

    // MARK: - Constraints

    /// Height of `dividerView` constraint
    @IBOutlet private(set) var dividerHeightConstraint: NSLayoutConstraint!

    /// `dividerView` leading to `contentView` leading constraint
    @IBOutlet private(set) var dividerLeadingConstraint: NSLayoutConstraint!

    /// `dividerView` top to `contentView` top constraint
    @IBOutlet private(set) var dividerTopConstraint: NSLayoutConstraint!

    /// `dividerView` trailing to `contentView` trailing constraint
    @IBOutlet private(set) var dividerTrailingConstraint: NSLayoutConstraint!

    /// `dividerView` bottom to `contentView` bottom constraint
    @IBOutlet private(set) var dividerBottomConstraint: NSLayoutConstraint!

    // MARK: - Edge Constraints

    /// `EdgeConstraints` of `divider` to `contentView`
    var dividerEdgeConstraints: EdgeConstraints {
        return EdgeConstraints(
            leading: dividerLeadingConstraint,
            top: dividerTopConstraint,
            trailing: dividerTrailingConstraint,
            bottom: dividerBottomConstraint
        )
    }

    /// `UIEdgeInsets` of the `dividerEdgeConstraints`
    var dividerInsets: UIEdgeInsets {
        get {
            return dividerEdgeConstraints.insets
        }
        set {
            var edgeConstraints = dividerEdgeConstraints
            edgeConstraints.insets = newValue
        }
    }
}
