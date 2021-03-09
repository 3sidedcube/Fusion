//
//  DividerRow.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit
import ThunderTable

/// `UITableViewCell` subclass
private typealias CellClass = DividerTableViewCell

/// A `Row` which draws a `Divider`
class DividerRow: Row {

    /// `Divider` to drive UI
    var divider: Divider

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - divider: `Divider`
    init(divider: Divider) {
        self.divider = divider
    }

    // MARK: - Row

    /// `UITableViewCell` subclass to draw
    var cellClass: UITableViewCell.Type? {
        return CellClass.self
    }

    /// `UITableViewCell.SelectionStyle`
    var selectionStyle: UITableViewCell.SelectionStyle? {
        return nil
    }

    // MARK: - Configure

    func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? CellClass else { return }

        // Configure defaults
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear

        // Set view-model
        cell.setDivider(divider)
    }
}
