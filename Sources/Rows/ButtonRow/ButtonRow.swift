//
//  ButtonRow.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit
import ThunderTable

/// A `Row` which draws a `Button`
class ButtonRow: FusionRow<ButtonTableViewCell>, RowActionable {

    /// `Button` to drive UI
    let button: Button

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - button: `Button`
    init(button: Button) {
        self.button = button
    }

    // MARK: - Row

    /// `SelectionHandler`
    var selectionHandler: SelectionHandler? {
        return { [weak self] row, _, _, _ in
            guard let row = row as? Self else { return }
            guard let action = try? row.button.action?.toAction() else { return }
            self?.actionHandler?.handleAction(action)
        }
    }

    // MARK: - Configure

    override func configureCell(
        _ cell: ButtonTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.setButton(button)
    }

    // MARK: - RowActionable

    /// `ActionHandler` to handle `Action`s
    weak var actionHandler: ActionHandler?
}
