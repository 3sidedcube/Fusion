//
//  CellDisplayable.swift
//  CBIT
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// Execute functionality on `tableView(_:willDisplay:forRowAt:)`
public protocol CellDisplayable {

    /// Called on `tableView(_:willDisplay:forRowAt:)` if the `Row` or `UITableViewCell`
    /// conforms to this protocol
    ///
    /// - Parameters:
    ///   - cell: `UITableViewCell`
    ///   - tableViewController: `TableViewController`
    ///   - indexPath: `IndexPath`
    func willDisplayCell(
        _ cell: UITableViewCell,
        in tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    )
}
