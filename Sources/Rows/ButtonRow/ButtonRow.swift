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
open class ButtonRow: FusionRow<ButtonTableViewCell> {

    /// `Button` to drive UI
    public let button: Button

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - button: `Button`
    public init(button: Button) {
        self.button = button
    }

    // MARK: - Configure

    override open func configureCell(
        _ cell: ButtonTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.buttonContainerView.setButton(button)

        // Handle click
        // Don't need to remove target-actions and just setting a closure
        cell.buttonContainerView.onButtonTouchUpInside = { [weak self] _ in
            self?.tryHandleAction(self?.button.action)
        }
    }
}
