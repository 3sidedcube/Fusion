//
//  RowConvertible.swift
//  Fusion
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
///
/// This is also where this protocol distinguishes from simply conforming to `Row`.
public protocol RowConvertible {

    /// Convert to a `Row`
    func toRow() throws -> Row
}
