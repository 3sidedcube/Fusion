//
//  ImageTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// A `UITableViewCell` with a single `UIImageView` contained in a `UIView`
class ImageTableViewCell: UITableViewCell {

    /// `UIView` container of `cellImageView`
    @IBOutlet private(set) var imageContainerView: ImageContainerView!

    // MARK: - ImageContainerView Constraints

    /// `imageContainerView` leading to `contentView` leading
    @IBOutlet private(set) var
        imageContainerViewLeadingConstraint: NSLayoutConstraint!

    /// `imageContainerView` top to `contentView` top
    @IBOutlet private(set) var
        imageContainerViewTopConstraint: NSLayoutConstraint!

    /// `imageContainerView` trailing to `contentView` trailing
    @IBOutlet private(set) var
        imageContainerViewTrailingConstraint: NSLayoutConstraint!

    /// `imageContainerView` bottom to `contentView` bottom
    @IBOutlet private(set) var
        imageContainerViewBottomConstraint: NSLayoutConstraint!

    // MARK: - ImageContainerView EdgeConstraints

    /// `EdgeConstraints` of `imageContainerView`
    var imageContainerViewEdgeConstraints: EdgeConstraints {
        return EdgeConstraints(
            leading: imageContainerViewLeadingConstraint,
            top: imageContainerViewTopConstraint,
            trailing: imageContainerViewTrailingConstraint,
            bottom: imageContainerViewBottomConstraint
        )
    }

    /// `UIEdgeInsets` of the `imageContainerViewEdgeConstraints`
    var imageContainerViewInsets: UIEdgeInsets {
        get {
            return imageContainerViewEdgeConstraints.insets
        }
        set {
            var edgeConstraints = imageContainerViewEdgeConstraints
            edgeConstraints.insets = newValue
        }
    }
}
