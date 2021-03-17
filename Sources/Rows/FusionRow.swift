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
open class FusionRow<T>: Row, CellHeightConfigurable, CellDisplayable,
    RowActionable where T: UITableViewCell {

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

        // Set defaults
        cell.setDefaults()

        // Subclasses perform configuration
        configureCell(cell, at: indexPath, in: tableViewController)

        // Inform the `Fusion` the row finished configuration
        Fusion.shared.rowDidConfigure(self, cell: cell)
    }

    open func configureCell(
        _ cell: T,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Subclasses may override
    }

    // MARK: - CellHeightConfigurable

    open func heightForRowAtIndexPath(
        _ indexPath: IndexPath,
        in tableViewController: TableViewController
    ) -> CGFloat {
        return UITableView.automaticDimension
    }

    // MARK: - CellDisplayable

    open func willDisplayCell(
        _ cell: UITableViewCell,
        forRowAt indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? T else { return }

        // Subclasses perform "willDisplay"
        willDisplayCell(cell, forRowAt: indexPath, in: tableViewController)

        // Inform the `Fusion` the row finished "willDisplay"
        Fusion.shared.rowWillDisplay(self, cell: cell)
    }

    open func willDisplayCell(
        _ cell: T,
        forRowAt indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Subclasses may override
    }

    // MARK: - RowActionable

    /// `ActionHandler` to handle `Action`s
    open weak var actionHandler: ActionHandler?
}
