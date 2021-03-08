//
//  TextRow.swift
//  CBIT
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// `UITableViewCell` subclass
private typealias CellClass = TextTableViewCell

/// A simple `Row` with a `text`
class TextRow: Row {

    /// `Text` to drive UI
    var text: Text

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - text: `Text`
    init(text: Text) {
        self.text = text
    }

    // MARK: - Row

    /// `UITableViewCell` subclass to draw
    var cellClass: UITableViewCell.Type? {
        return CellClass.self
    }

    /// `UITableViewCell.SelectionStyle`
    var selectionStyle: UITableViewCell.SelectionStyle? {
        return nil
    }

    // MARK: - Configure

    func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? CellClass else { return }

        // Configure defaults
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear

        // Set view-model
        cell.setText(text)
    }
}
