//
//  TextTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// Simple `UITableViewCell` with a `label` inset from the `contentView`
class TextTableViewCell: UITableViewCell {

    /// The `UILabel`
    @IBOutlet private(set) var label: InsetLabel!

    // MARK: - Constraints

    /// `label` leading to `contentView` leading
    @IBOutlet private(set) var labelLeadingConstraint: NSLayoutConstraint!

    /// `label` top to `contentView` top
    @IBOutlet private(set) var labelTopConstraint: NSLayoutConstraint!

    /// `label` trailing to `contentView` trailing
    @IBOutlet private(set) var labelTrailingConstraint: NSLayoutConstraint!

    /// `label` bottom to `contentView` bottom
    @IBOutlet private(set) var labelBottomConstraint: NSLayoutConstraint!

    // MARK: - Label Insets

    /// `EdgeConstraints` of `label` to `self`
    var labelEdgeConstraints: EdgeConstraints {
        return EdgeConstraints(
            leading: labelLeadingConstraint,
            top: labelTopConstraint,
            trailing: labelTrailingConstraint,
            bottom: labelBottomConstraint
        )
    }

    /// `UIEdgeInsets` of the `label` constraints
    var labelInsets: UIEdgeInsets {
        get {
            return labelEdgeConstraints.insets
        }
        set {
            var edgeConstraints = labelEdgeConstraints
            edgeConstraints.insets = newValue
        }
    }
}
