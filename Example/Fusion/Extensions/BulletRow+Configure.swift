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
        cell.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        // subtitleLabel
        cell.subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        // numberLabel
        let numberLabel = cell.numberLabel
        numberLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        numberLabel?.backgroundColor = UIColor(
            red: 247 / 255, green: 241 / 255, blue: 247 / 255, alpha: 1
        )
        numberLabel?.textColor = UIColor(
            red: 123 / 255, green: 63 / 255, blue: 155 / 255, alpha: 1
        )
        numberLabel?.insets = .init(top: 2, left: 2, bottom: 2, right: 2)
        numberLabel?.textAlignment = .center

        // hStackView
        cell.hStackView.spacing = 8
        cell.hStackView.alignment = .top

        // vStackView
        cell.vStackView.spacing = 4

        let separatorColor = UIColor(
            red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1
        )
        cell.separators = [LineSeparator(
            position: .bottom, strokeWidth: 2, strokeColor: separatorColor)
        ]
    }

    func willDisplay(cell: UITableViewCell) {
        guard
            let cell = cell as? ListItemTableViewCell,
            let numberLabel = cell.numberLabel
        else {
            return
        }

        numberLabel.layer.masksToBounds = true
        numberLabel.updateCorners(.circular)

        numberLabel.setNeedsLayout()
        numberLabel.layoutIfNeeded()

        numberLabel.updateCorners(.circular)
    }
}

// MARK: - ListItemTableViewCell + UI

extension ListItemTableViewCell {

    var listItemView: ListItemView {
        return listItemContainerView.listItemView
    }

    var hStackView: UIStackView {
        return listItemView.hStackView
    }

    var vStackView: UIStackView {
        return listItemView.vStackView
    }

    var titleContainerView: LabelContainerView {
        return listItemView.titleLabelContainerView
    }

    var titleLabel: InsetLabel {
        return titleContainerView.label
    }

    var subtitleContainerView: LabelContainerView {
        return listItemView.subtitleLabelContainerView
    }

    var subtitleLabel: InsetLabel {
        return subtitleContainerView.label
    }

    var numberContainerView: NumberContainerView? {
        return listItemView.firstSubviewOfType()
    }

    var numberLabel: InsetLabel? {
        return numberContainerView?.label
    }
}
