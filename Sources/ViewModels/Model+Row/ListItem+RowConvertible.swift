//
//  ListItem+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import ThunderTable

extension ListItem: RowConvertible {

    /// Create an `ImageRow`
    func toRow() throws -> Row {
        return DefaultRow(listItem: self)
    }
}
