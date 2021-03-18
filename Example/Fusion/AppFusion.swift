//
//  AppFusion.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//

import Foundation
import UIKit
import Fusion

/// Provide an override of `Fusion` to provide app specific configuration
class AppFusion: Fusion {

    /// Override providing custom `JSONModel`s
    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [Card.self]
    }

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
}
