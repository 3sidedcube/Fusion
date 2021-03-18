//
//  TextRow.swift
//  Fusion
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A `Row` which draws a `Text`
open class TextRow: FusionRow<TextTableViewCell> {

    /// `Text` to drive UI
    public let text: Text

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - text: `Text`
    public init(text: Text) {
        self.text = text
    }

    // MARK: - Configure

    override open func configureCell(
        _ cell: TextTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        cell.labelContainerView.setText(text)
    }
}
