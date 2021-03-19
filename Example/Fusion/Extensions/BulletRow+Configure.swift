//
//  BulletRow+Configure.swift
//  Example
//
//  Created by Ben Shutt on 17/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import Fusion

extension BulletRow {

    /// Provide app specific customization to this `BulletRow` and the given `cell`
    ///
    /// - Parameter cell: `UITableViewCell`
    func configure(cell: UITableViewCell) {
        guard let cell = cell as? ListItemTableViewCell else { return }

        // listItemView
        cell.listItemView.padding = .init(top: 13, left: 20, right: 20, bottom: 18)

        // titleLabel
        cell.titleLabel.font = .cellTitleFont

        // subtitleLabel
        cell.subtitleLabel.font = .cellSubtitleFont

        // numberLabel
        let numberLabel = cell.numberLabel
        numberLabel?.font = .cellTitleFont
        numberLabel?.backgroundColor = .paleMauve
        numberLabel?.textColor = .mediumPurple
        numberLabel?.insets = .init(top: 2, left: 2, bottom: 2, right: 2)
        numberLabel?.textAlignment = .center

        // hStackView
        cell.hStackView.spacing = 8
        cell.hStackView.alignment = .top

        // vStackView
        cell.vStackView.spacing = 4

        // separators
        cell.separators = [LineSeparator(
            position: .bottom, strokeWidth: 2, strokeColor: .separatorColor
        )]
    }

    /// Handle the display of `cell`
    ///
    /// - Parameter cell: `UITableViewCell`
    func willDisplay(cell: UITableViewCell) {
        guard
            let cell = cell as? ListItemTableViewCell,
            let numberLabel = cell.numberLabel
        else {
            return
        }

        numberLabel.layer.masksToBounds = true
        numberLabel.updateCorners(.circular) // Add constraints if needed
        numberLabel.setNeedsLayout()
        numberLabel.layoutIfNeeded()
        numberLabel.updateCorners(.circular)
    }
}
