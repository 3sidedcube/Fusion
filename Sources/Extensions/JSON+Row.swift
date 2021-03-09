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
import os // OSLog

extension JSON {

    /// Parse this `JSON` instance into a `JSONModel` then convert to an `[Row]`
    var rows: [Row] {
        // Load this `JSON` instance into a `JSONModel`
        let jsonModel: JSONModel? = self.jsonModel()

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

    /// Execute `toJSONModel()` catch the `Error` and logging
    private func jsonModel() -> JSONModel? {
        do {
            return try toJSONModel()
        } catch {
            let message = "\(JSONModel.self) decode failed: \(error)"
            os_log(.error, log: .logger, "%@", message)
            return nil
        }
    }
}
