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

    /// Data to drive `UITableView`.
    /// That is, an `Array` of `Section`s containing an `Array` of `Row`s (2 dimensions).
    var data: [Section] {
        return listView?.children.map {
            return Section(
                rows: $0.rows,
                headerHeight: 0,
                headerView: UIView(),
                footerHeight: 0,
                footerView: UIView()
            )
        } ?? []
    }
}

// MARK: - TableSection + Row

extension TableSection {

    /// `Row`s in this `TableSection`
    var rows: [Row] {
        return children.array?.flatMap { $0.rows } ?? []
    }
}
