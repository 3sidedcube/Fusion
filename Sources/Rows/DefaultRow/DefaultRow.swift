//
//  DefaultRow.swift
//  CBIT
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// `UITableViewCell` subclass (may be used by subclasses)
typealias DefaultCellClass = DefaultTableViewCell

/// A `Row` with a title, subtitle
class DefaultRow: Row {

    /// `String` title text
    var titleText: String?

    /// `String` subtitle text
    var subtitleText: String?

    /// `UIEdgeInsets` of the `shadowContainerView` from the `contentView`
    var containerInsets = UIEdgeInsets(
        top: 8,
        left: .defaultHorizontalMargin,
        bottom: 8,
        right: .defaultHorizontalMargin
    )

    /// `UIEdgeInsets` of the `shadowContainerView` from the `contentView`
    var innerInsets = UIEdgeInsets(
        top: 13, left: 15, bottom: 13, right: 15
    )

    /// Spacing between `titleLabel` and `subtitleLabel`
    var titleSpacing: CGFloat = 0

    /// `SelectionHandler`
    var selectionHandler: SelectionHandler?

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - title: `String`
    ///   - subtitle: `String`
    init(title: String?, subtitle: String?) {
        self.titleText = title
        self.subtitleText = subtitle
    }

    // MARK: - Row

    /// `UITableViewCell` subclass to draw
    var cellClass: UITableViewCell.Type? {
        return DefaultCellClass.self
    }

    /// `UITableViewCell.AccessoryType`
    var accessoryType: UITableViewCell.AccessoryType? {
        get {
            return UITableViewCell.AccessoryType.none
        }
        // swiftlint:disable unused_setter_value
        set {
        }
        // swiftlint:enable unused_setter_value
    }

    // MARK: - Configure

    func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? DefaultCellClass else { return }
        cell.setDefaults()

        /*
        // containerViews
        cell.containerViews.forEach {
            $0.backgroundColor = .defaultUnhighlightedColor
            $0.layer.shadow = nil
            $0.layer.cornerRadius = 0
            $0.layer.cornerCurve = .continuous
            $0.layer.cornerRadius = .containerCornerRadius
        }

        // shadowContainerView
        cell.shadowContainerView.clipsToBounds = false
        cell.shadowContainerView.layer.setSketchShadow(SketchShadow(
            color: .cbitGray, alpha: 0.2, x: 0, y: 2, blur: 8, spread: 0
        ))

        // containerView
        cell.containerView.clipsToBounds = true

        // verticalStackView
        cell.verticalStackView.spacing = titleSpacing

        // labels
        cell.labels.forEach {
            $0.setDefaults()
        }

        // titleLabel
        cell.titleLabel.setTextAndHidden(titleText)
        cell.titleLabel.font = UIFont.font(ofSize: 16, weight: .bold)

        // subtitleLabel
        cell.subtitleLabel.setTextAndHidden(subtitleText)
        cell.subtitleLabel.font = UIFont.font(ofSize: 14, weight: .regular)

        // leadingContainerView
        cell.leadingContainerView.isHidden = true
        cell.leadingContainerView.layer.setSketchShadow(SketchShadow(
            color: .cbitPurple, alpha: 0.2, x: 0, y: 3, blur: 10, spread: 0
        ))

        // trailingImageView
        cell.trailingImageView.isHidden = true

        // insets
        cell.shadowContainerViewInsets = containerInsets
        cell.horizontalStackViewInsets = innerInsets
 */
    }
}
