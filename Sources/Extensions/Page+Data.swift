//
//  Page+Data.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// Define `Section` as `DeclarativeSection`
typealias Section = ThunderTable.DeclarativeSection

extension Page {

    /// Data to drive a `UITableView`.
    /// That is, an `Array` of `Section`s containing an `Array` of `Row`s
    ///
    /// - Note:
    /// Technically, returning an `[Section]`, this is 2 dimensional. Sections/headers/footers
    /// are less of a thing on Android so we, in practice, work with a 1 dimensional `[Row]`. From this
    /// we can still achieve the same outcome as `[Section]`.
    var data: [Section] {
        let rows = screen?.children.array?.flatMap { $0.rows } ?? []
        return [Section(
            rows: rows,
            headerHeight: 0,
            headerView: UIView(),
            footerHeight: 0,
            footerView: UIView()
        )]
    }
}
