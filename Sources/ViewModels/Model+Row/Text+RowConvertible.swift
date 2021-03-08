//
//  Text+RowConvertible.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation
import ThunderTable

extension Text: RowConvertible {

    func toRow() throws -> Row {
        return TextRow(text: self)
    }
}
