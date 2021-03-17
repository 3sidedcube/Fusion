//
//  BulletRow+Configure.swift
//  Example
//
//  Created by Ben Shutt on 17/03/2021.
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
        let listItemView = cell.listItemContainerView.listItemView
        listItemView.padding = .init(top: 13, left: 20, right: 20, bottom: 18)

        // titleLabel
        let titleContainerView = listItemView.titleLabelContainerView
        let titleLabel = titleContainerView.label
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        // subtitleLabel
        let subtitleContainerView = listItemView.subtitleLabelContainerView
        let subtitleLabel = subtitleContainerView.label
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        // numberLabel
        let numberContainerView: NumberContainerView? = listItemView.firstSubviewOfType()
        let numberLabel = numberContainerView?.label
        numberLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        numberLabel?.backgroundColor = UIColor(
            red: 247 / 255, green: 241 / 255, blue: 247 / 255, alpha: 1
        )
        numberLabel?.textColor = UIColor(
            red: 123 / 255, green: 63 / 255, blue: 155 / 255, alpha: 1
        )
        numberLabel?.insets = .init(top: 2, left: 2, bottom: 2, right: 2)

        // hStackView
        let hStackView = listItemView.hStackView
        hStackView.spacing = 8

        // vStackView
        let vStackView = listItemView.vStackView
        vStackView.spacing = 4

        let separatorColor = UIColor(
            red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1
        )
        cell.separators = [TableSeparator(
            position: .bottom, strokeWidth: 2, strokeColor: separatorColor)
        ]
    }
}
