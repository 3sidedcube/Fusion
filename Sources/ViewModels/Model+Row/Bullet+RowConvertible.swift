//
//  Bullet+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 17/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

extension Bullet: RowConvertible {

    /// Create a `BulletRow`
    public func toRow() throws -> Row {
        return BulletRow(bullet: self)
    }
}
