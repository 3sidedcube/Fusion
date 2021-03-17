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

    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [Card.self]
    }

    override func rowDidConfigure<T>(
        _ row: FusionRow<T>,
        cell: T
    ) where T: UITableViewCell {
        if let bulletRow = row as? BulletRow {
            bulletRow.configure(cell: cell)
        }
    }
}
