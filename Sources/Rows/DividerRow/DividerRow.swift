//
//  DividerRow.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit
import ThunderTable

/// A `Row` which draws a `Divider`
class DividerRow: FusionRow<DividerTableViewCell>, CellHeightConfigurable {

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

    // MARK: - Configure

    override func configureCell(
        _ cell: DividerTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.setDivider(divider)
    }

    // MARK: - CellHeightConfigurable

    func heightForRowInTableViewController(
        _ tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) -> CGFloat {
        guard divider.totalHeight > 0 else { return 0 }
        return UITableView.automaticDimension
    }
}
