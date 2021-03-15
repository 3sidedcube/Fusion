//
//  CardTableViewCell.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//

import UIKit
import Fusion

/// `UITableViewCell` for displaying `Card` UI
class CardTableViewCell: UITableViewCell {

    /// Root container `UIView` of other subview content
    @IBOutlet private(set) var containerView: UIView!

    /// Container `UIView` of `stackView`
    @IBOutlet private(set) var stackViewContainerView: UIView!

    /// `stackView` for laying out content vertically
    @IBOutlet private(set) var stackView: UIStackView!

    /// `UIImageView` for drawing image
    @IBOutlet private(set) var cellImageView: AdjustableImageView!

    /// `UILabel` for drawing title
    @IBOutlet private(set) var titleLabel: UILabel!

    /// `UILabel` for drawing subtitle
    @IBOutlet private(set) var subtitleLabel: UILabel!

    // MARK: - Computed

    /// Container `UIView`s
    var containerViews: [UIView] {
        return [containerView, stackViewContainerView]
    }

    /// `UILabel`s
    var labels: [UILabel] {
        return [titleLabel, subtitleLabel]
    }
}
