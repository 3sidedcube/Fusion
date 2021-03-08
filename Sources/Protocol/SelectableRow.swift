//
//  SelectableRow.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation
import ThunderTable

/// A `Row` where the `selectionHandler` can be `set`
protocol SelectableRow: Row {

    /// `get` and `set` the `SelectionHandler`
    var selectionHandler: SelectionHandler? { get set }
}
