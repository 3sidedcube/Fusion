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

/// A `Row` which draws a `Text`
class TextRow: FusionRow<TextTableViewCell> {

    /// `Text` to drive UI
    let text: Text

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - text: `Text`
    init(text: Text) {
        self.text = text
    }

    // MARK: - Configure

    override func configureCell(
        _ cell: TextTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.setText(text)
    }
}
