//
//  DefaultTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` which a title, subtitle, and leading container `UIView`
class DefaultTableViewCell: UITableViewCell, Highlightable {

    /// Container `UIView` of all other content
    @IBOutlet private(set) var shadowContainerView: UIView!

    /// Container `UIView` of other content in `shadowContainerView`
    @IBOutlet private(set) var containerView: HighlightableView!

    /// Root horizontal `UIStackView`
    @IBOutlet private(set) var horizontalStackView: UIStackView!

    /// Container `UIView` at the leading of `horizontalStackView`
    @IBOutlet private(set) var leadingContainerView: UIView!

    /// Vertical `UIStackView` for title labels, at the end of `horizontalStackView`
    @IBOutlet private(set) var verticalStackView: UIStackView!

    /// Title `UILabel`
    @IBOutlet private(set) var titleLabel: UILabel!

    /// Subtitle `UILabel`
    @IBOutlet private(set) var subtitleLabel: UILabel!

    /// Trailing `UIImageView` at the trailing of `horizontalStackView`
    @IBOutlet private(set) var trailingImageView: UIImageView!

    // MARK: - Container Constraints

    /// `shadowContainerView` leading to `self` leading `NSLayoutConstraint`
    @IBOutlet private(set) var
        shadowContainerViewLeadingConstraint: NSLayoutConstraint!

    /// `shadowContainerView` top to `self` top `NSLayoutConstraint`
    @IBOutlet private(set) var
        shadowContainerViewTopConstraint: NSLayoutConstraint!

    /// `shadowContainerView` trailing to `self` trailing `NSLayoutConstraint`
    @IBOutlet private(set) var
        shadowContainerViewTrailingConstraint: NSLayoutConstraint!

    /// `shadowContainerView` trailing to `self` trailing `NSLayoutConstraint`
    @IBOutlet private(set) var
        shadowContainerViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Shadow Insets

    /// `UIEdgeInsets` of the `shadowContainerView` constraints
    var shadowContainerViewInsets: UIEdgeInsets {
        get {
            return UIEdgeInsets(
                top: shadowContainerViewTopConstraint.constant,
                left: shadowContainerViewLeadingConstraint.constant,
                bottom: -shadowContainerViewBottomConstraint.constant, // Inset
                right: -shadowContainerViewTrailingConstraint.constant // Inset
            )
        }
        set {
            shadowContainerViewTopConstraint.constant = newValue.top
            shadowContainerViewLeadingConstraint.constant = newValue.left
            shadowContainerViewBottomConstraint.constant = -newValue.bottom // Inset
            shadowContainerViewTrailingConstraint.constant = -newValue.right // Inset
        }
    }

    // MARK: - Inner Constraints

    /// `horizontalStackView` leading to `self` leading `NSLayoutConstraint`
    @IBOutlet private(set) var
        horizontalStackViewLeadingConstraint: NSLayoutConstraint!

    /// `horizontalStackView` top to `self` top `NSLayoutConstraint`
    @IBOutlet private(set) var
        horizontalStackViewTopConstraint: NSLayoutConstraint!

    /// `horizontalStackView` trailing to `self` trailing `NSLayoutConstraint`
    @IBOutlet private(set) var
        horizontalStackViewTrailingConstraint: NSLayoutConstraint!

    /// `horizontalStackView` trailing to `self` trailing `NSLayoutConstraint`
    @IBOutlet private(set) var
        horizontalStackViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Shadow Insets

    /// `UIEdgeInsets` of the `horizontalStackView` constraints
    var horizontalStackViewInsets: UIEdgeInsets {
        get {
            return UIEdgeInsets(
                top: horizontalStackViewTopConstraint.constant,
                left: horizontalStackViewLeadingConstraint.constant,
                bottom: -horizontalStackViewBottomConstraint.constant, // Inset
                right: -horizontalStackViewTrailingConstraint.constant // Inset
            )
        }
        set {
            horizontalStackViewTopConstraint.constant = newValue.top
            horizontalStackViewLeadingConstraint.constant = newValue.left
            horizontalStackViewBottomConstraint.constant = -newValue.bottom // Inset
            horizontalStackViewTrailingConstraint.constant = -newValue.right // Inset
        }
    }

    // MARK: - Computed

    /// `UILabel` subviews
    var labels: [UILabel] {
        return [titleLabel, subtitleLabel].compactMap { $0 }
    }

    /// `UIView` containers
    var containerViews: [UIView] {
        return [shadowContainerView, containerView].compactMap { $0 }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        updateHighlighted()
        selectedBackgroundView = UIView()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        set(highlighted: highlighted, animated: animated)
    }

    // MARK: - Highlightable

    var viewToHighlight: UIView {
        return containerView
    }

    var unhighlightedColor: UIColor {
        return containerView?.unhighlightedColor ?? .defaultUnhighlightedColor
    }

    var highlightedColor: UIColor {
        return containerView?.highlightedColor ?? .defaultHighlightedColor
    }
}
