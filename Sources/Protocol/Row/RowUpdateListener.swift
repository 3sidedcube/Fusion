//
//  RowUpdateListener.swift
//  Fusion
//
//  Created by Ben Shutt on 13/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

/// A `TableViewController` which responds to `Row`s who request a `UITableView` update
public protocol RowUpdateListener: TableViewController {

    /// The given `row` requests a `UITableView` update
    ///
    /// - Parameter row: `Row`
    func rowRequestedUpdate(_ row: Row)
}
