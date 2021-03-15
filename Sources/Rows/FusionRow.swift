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
open class FusionRow<T>: Row, CellHeightConfigurable where T: UITableViewCell {

    // MARK: - Init

    /// Public initializer
    public init() {
    }

    // MARK: - Row

    /// `UITableViewCell` subclass to draw
    open var cellClass: UITableViewCell.Type? {
        return T.self
    }

    /// `UITableViewCell.SelectionStyle`
    open var selectionStyle: UITableViewCell.SelectionStyle? {
        guard selectionHandler != nil else { return UITableViewCell.SelectionStyle.none }
        return .default
    }

    /// `SelectionHandler` - by default do not handle selection
    open var selectionHandler: SelectionHandler? {
        return nil
    }

    // MARK: - Configure

    open func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? T else { return }
        cell.setDefaults()
        configureCell(cell, at: indexPath, in: tableViewController)
    }

    open func configureCell(
        _ cell: T,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Subclasses should override
    }

    // MARK: - CellHeightConfigurable

    open func heightForRowInTableViewController(
        _ tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}
