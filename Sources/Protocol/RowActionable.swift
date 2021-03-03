//
//  RowActionable.swift
//  CBIT
//
//  Created by Ben Shutt on 13/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import ThunderTable

/// A `Row` which may invoke an `Action`
protocol RowActionable: Row, AnyObject {

    /// An `ActionHandler` property to handle `Action`s
    var actionHandler: ActionHandler? { get set }
}
