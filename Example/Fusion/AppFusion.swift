//
//  AppFusion.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import Fusion

/// Provide an override of `Fusion` to provide app specific configuration
class AppFusion: Fusion {

    // MARK: - JSONModel

    /// Override providing custom `JSONModel`s
    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [Card.self]
    }

    // MARK: - Configuration

    override var pullPageToRefresh: Bool {
        return true
    }

    // MARK: - Action

    override func handleAction(_ action: Action) -> Bool {
        let didHandle = super.handleAction(action)
        guard !didHandle else { return didHandle /* true */ }
        // Handle action
        return false
    }

    override func handleNativeAction(_ nativeAction: NativeAction) -> Bool {
        guard nativeAction.identifier != nil else { return false }
        // Handle native identifier
        return false
    }

    // MARK: - Row

    /// Add app specific customization `Row`s created in `Fusion`
    ///
    /// - Parameters:
    ///   - row: `Row` which did configure
    ///   - cell: `CellClass`, a `UITableViewCell`, which `row` will draw
    override func rowDidConfigure<CellClass>(
        _ row: FusionRow<CellClass>,
        cell: CellClass
    ) where CellClass: UITableViewCell {
        if let bulletRow = row as? BulletRow {
            bulletRow.configure(cell: cell)
        }
    }

    override func rowWillDisplay<CellClass>(
        _ row: FusionRow<CellClass>,
        cell: CellClass
    ) where CellClass: UITableViewCell {
        if let bulletRow = row as? BulletRow {
            bulletRow.willDisplay(cell: cell)
        }
    }

    // MARK: - UI

    override func imageForAccessoryType(
        _ accessoryType: UITableViewCell.AccessoryType
    ) -> UIImage? {
        guard case .disclosureIndicator = accessoryType else { return nil }
        return .chevron
    }
}
