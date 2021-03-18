//
//  CellHeightConfigurable.swift
//  Fusion
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// Execute functionality on `tableView(_:heightForRowAt:)`
public protocol CellHeightConfigurable {

    /// Called on `tableView(_:heightForRowAt:)` if the `Row` (not `UITableViewCell`)
    /// conforms to this protocol
    ///
    /// - Parameters:
    ///   - tableViewController: `TableViewController`
    ///   - indexPath: `IndexPath`
    func heightForRowAtIndexPath(
        _ indexPath: IndexPath,
        in tableViewController: TableViewController
    ) -> CGFloat
}
