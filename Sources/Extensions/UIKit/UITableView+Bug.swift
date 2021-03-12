//
//  UITableView+Bug.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation
import UIKit

extension UITableView {

    /// Fix multi-line `UILabel` inside `UIStackView` inside  `UITableViewCell` bug 🤮.
    ///
    /// This code code is not ideal, but the `preferredMaxLayoutWidth` of the `UILabel`s
    /// are not being set correctly/automatically when loading a cell from a nib or Storyboard.
    ///
    /// https://github.com/smileyborg/TableViewCellWithAutoLayoutiOS8/issues/22#issuecomment-89853337
    func fixMultiLineLabelBugForCell(_ cell: UITableViewCell) {
        cell.frame = CGRect(
            x: 0, y: 0, width: bounds.size.width, height: 99_999
        )
        cell.contentView.bounds = cell.bounds
        cell.layoutIfNeeded()

        var labels: [UILabel] = cell.subviewsOfType()
        labels = labels.filter { $0.numberOfLines == 0 }
        labels.forEach {
            $0.preferredMaxLayoutWidth = $0.frame.size.width
        }
    }
}
