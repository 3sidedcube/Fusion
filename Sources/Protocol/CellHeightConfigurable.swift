//
//  CellHeightConfigurable.swift
//  CBIT
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// Execute functionality on `tableView(_:heightForRowAt:)`
protocol CellHeightConfigurable {

    /// Called on `tableView(_:heightForRowAt:)` if the `Row` (not `UITableViewCell`)
    /// conforms to this protocol
    ///
    /// - Parameters:
    ///   - tableViewController: `TableViewController`
    ///   - indexPath: `IndexPath`
    func heightForRowInTableViewController(
        _ tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) -> CGFloat
}
