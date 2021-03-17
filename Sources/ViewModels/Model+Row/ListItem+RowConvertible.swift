//
//  ListItem+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import ThunderTable

extension ListItem: RowConvertible {

    /// Create a `ListItemRow`
    public func toRow() throws -> Row {
        return ListItemRow(listItem: self)
    }
}
