//
//  Divider+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

extension Divider: RowConvertible {

    /// Create a `DividerRow`
    public func toRow() throws -> Row {
        return DividerRow(divider: self)
    }
}
