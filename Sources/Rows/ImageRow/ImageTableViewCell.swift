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
    @IBOutlet private(set) var imageContainerView: UIView!

    /// `UIImageView` of the cell
    @IBOutlet private(set) var cellImageView: UIImageView!

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

    // MARK: - ImageView Constraints

    /// `cellImageView` leading to `imageContainerView` leading
    @IBOutlet private(set) var imageViewLeadingConstraint: NSLayoutConstraint!

    /// `cellImageView` top to `imageContainerView` top
    @IBOutlet private(set) var imageViewTopConstraint: NSLayoutConstraint!

    /// `cellImageView` trailing to `imageContainerView` trailing
    @IBOutlet private(set) var imageViewTrailingConstraint: NSLayoutConstraint!

    /// `cellImageView` bottom to `imageContainerView` bottom
    @IBOutlet private(set) var imageViewBottomConstraint: NSLayoutConstraint!

    // MARK: - ImageView EdgeConstraints

    /// `EdgeConstraints` of `cellImageView`
    var imageViewEdgeConstraints: EdgeConstraints {
        return EdgeConstraints(
            leading: imageViewLeadingConstraint,
            top: imageViewTopConstraint,
            trailing: imageViewTrailingConstraint,
            bottom: imageViewBottomConstraint
        )
    }

    /// `UIEdgeInsets` of the `imageViewEdgeConstraints`
    var imageViewInsets: UIEdgeInsets {
        get {
            return imageViewEdgeConstraints.insets
        }
        set {
            var edgeConstraints = imageViewEdgeConstraints
            edgeConstraints.insets = newValue
        }
    }
}
