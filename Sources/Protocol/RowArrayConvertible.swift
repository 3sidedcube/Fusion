//
//  RowArrayConvertible.swift
//  CBIT
//
//  Created by Ben Shutt on 05/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

/// An entity which can be converted to an `[Row]`.
///
/// - Note:
/// If `[Row]` can not be created it should `throw`.
/// I.e. `nil` is not an acceptable state; this entity should correspond to a `[Row]`
/// unless there is an `Error`.
protocol RowArrayConvertible {

    /// Convert to an `[Row]`
    func toRows() throws -> [Row]
}
