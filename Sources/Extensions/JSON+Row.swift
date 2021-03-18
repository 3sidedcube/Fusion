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
    ///
    /// - Note:
    /// Occasionally (rarely) a `JSON` would instantiate an `Array` of `Row`, hence this
    /// method returns `[Row]`.
    var rows: [Row] {
        // Load this `JSON` instance into a `JSONModel`
        guard let jsonModel: JSONModel = self.jsonModel() else { return [] }

        // Check if the app specifies it's own row for this model
        if let row = Fusion.shared.rowForModel(jsonModel) {
            return [row]
        }

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
            Fusion.shared.log(type: .error, message: message)
            return nil
        }
    }
}
