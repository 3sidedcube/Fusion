//
//  DividerRow.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A `Row` which draws a `Divider`
open class DividerRow: FusionRow<DividerTableViewCell> {

    /// `Divider` to drive UI
    public let divider: Divider

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - divider: `Divider`
    public init(divider: Divider) {
        self.divider = divider
    }

    // MARK: - Configure

    override open func configureCell(
        _ cell: DividerTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.dividerContainerView.setDivider(divider)
    }

    // MARK: - CellHeightConfigurable

    override open func heightForRowAtIndexPath(
        _ indexPath: IndexPath,
        in tableViewController: TableViewController
    ) -> CGFloat {
        return divider.height.cgFloat
    }
}
