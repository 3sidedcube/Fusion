//
//  Divider+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import ThunderTable

extension Divider: RowConvertible {

    /// Create a `DividerRow`
    func toRow() throws -> Row {
        return DividerRow(divider: self)
    }
}
