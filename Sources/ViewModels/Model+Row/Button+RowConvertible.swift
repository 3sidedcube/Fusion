//
//  Button+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

extension Button: RowConvertible {

    /// Create a `ButtonRow`
    public func toRow() throws -> Row {
        return ButtonRow(button: self)
    }
}
