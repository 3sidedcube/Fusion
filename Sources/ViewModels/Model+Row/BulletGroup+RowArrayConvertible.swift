//
//  BulletGroup+RowArrayConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import ThunderTable

extension BulletGroup: RowArrayConvertible {

    /// Convert to `NumberRow`s
    func toRows() throws -> [Row] {
        return children
            .enumerated()
            .compactMap {
                let number = $0.offset + 1
                let row = try? $0.element.toRow()
                (row as? NumberRow)?.number = number
                return row
            }
    }
}
