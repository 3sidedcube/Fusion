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

    // MARK: - Configure

    override func configureCell(
        _ cell: ButtonTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.setButton(button)

        // Handle click
        cell.buttonContainerView.removeButtonTargetActions()
        cell.buttonContainerView.onButtonTouchUpInside = { [weak self] _ in
            self?.tryHandleAction(self?.button.action)
        }
    }

    // MARK: - RowActionable

    /// `ActionHandler` to handle `Action`s
    weak var actionHandler: ActionHandler?
}
