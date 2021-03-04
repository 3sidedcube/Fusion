//
//  JSON+Row.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON
import ThunderTable

extension JSON {

    /// Parse this `JSON` instance into a `JSONModel` then convert to an `[Row]`
    var rows: [Row] {
        // Load this `JSON` instance into a `JSONModel`
        let jsonModel: JSONModel? = try? toJSONModel()

        // Try `RowArrayConvertible` cast
        if let rows = try? (jsonModel as? RowArrayConvertible)?.toRows() {
            return rows
        }

        // Try `RowConvertible` cast
        if let row = try? (jsonModel as? RowConvertible)?.toRow() {
            return [row]
        }

        // Try `Row` cast
        if let row = jsonModel as? Row {
            return [row]
        }

        return []
    }
}
