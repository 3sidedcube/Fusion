//
//  FusionRow.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit
import ThunderTable

/// Base `Row` for other `Row`s in this project
class FusionRow<T>: Row, CellHeightConfigurable where T: UITableViewCell {

    // MARK: - Row

    /// `UITableViewCell` subclass to draw
    var cellClass: UITableViewCell.Type? {
        return T.self
    }

    /// `UITableViewCell.SelectionStyle`
    var selectionStyle: UITableViewCell.SelectionStyle? {
        guard selectionHandler != nil else { return UITableViewCell.SelectionStyle.none }
        return .default
    }

    /// `SelectionHandler` - by default do not handle selection
    var selectionHandler: SelectionHandler? {
        return nil
    }

    // MARK: - Configure

    func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? T else { return }
        cell.setDefaults()
        configureCell(cell, at: indexPath, in: tableViewController)
    }

    func configureCell(
        _ cell: T,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Subclasses should override
    }

    // MARK: - CellHeightConfigurable

    func heightForRowInTableViewController(
        _ tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}
