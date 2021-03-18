//
//  Card+RowConvertible.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable
import Fusion

extension Card: RowConvertible {

    /// Map `Card` model to `CardRow`
    public func toRow() throws -> Row {
        return CardRow(card: self)
    }
}
