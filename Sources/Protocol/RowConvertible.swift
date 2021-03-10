//
//  RowConvertible.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

/// An entity which can be converted to a `Row`.
///
/// - Note:
/// If a `Row` can not be created it should `throw`.
/// I.e. `nil` is not an acceptable state; this entity should correspond to a  `Row`
/// unless there is an `Error`.
public protocol RowConvertible {

    /// Convert to a `Row`
    func toRow() throws -> Row
}
