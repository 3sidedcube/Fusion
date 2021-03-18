//
//  BulletGroup+RowArrayConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

extension BulletGroup: RowArrayConvertible {

    /// Convert to `NumberRow`s
    public func toRows() throws -> [Row] {
        return children
            .enumerated()
            .compactMap {
                let number = $0.offset + 1
                let row = try? $0.element.toRow()
                (row as? BulletRow)?.numberStyle = .explicit(number)
                return row
            }
    }
}
