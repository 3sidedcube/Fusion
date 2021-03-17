//
//  BulletRow.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A `ListItemRow` where the `ImageContainerView` is replaced by a `LabelContainerView`.
///
/// This might be used for, say, a numbered list in a CMS `Page` where each `BulletRow` represents 1 item.
class BulletRow: ListItemRow, CellDisplayable {

    /// Explicitly provide a number for label text
    var number: Int?

    /// `Bullet` model to drive UI
    private let bullet: Bullet

    /// Get the number of the `BulletRow` from its neighbourhood of `BulletRow`s
    var numberFromNeighbourhood = false

    /// Initialize with `bullet`
    ///
    /// - Parameter bullet: `Bullet`
    init(bullet: Bullet) {
        self.bullet = bullet
        super.init(listItem: bullet.listItem)
    }

    // MARK: - Row

    override func configureCell(
        _ cell: ListItemTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        super.configureCell(cell, at: indexPath, in: tableViewController)

        // `listItemContainerView`
        let listItemView = cell.listItemContainerView.listItemView

        // Replace `imageContainerView` with `NumberContainerView` and
        // handle subview re-use
        listItemView.imageContainerView.removeFromSuperview()
        let numberContainerViews: [NumberContainerView] = listItemView.subviewsOfType()
        numberContainerViews.forEach { $0.removeFromSuperview() }

        // Create a `NumberContainerView` instance and add to UI
        let numberContainerView = NumberContainerView()
        listItemView.hStackView.insertArrangedSubview(numberContainerView, at: 0)
        numberContainerView.label.setContent(
            hugging: 800,
            compressionResistance: 800,
            axis: [.horizontal, .vertical]
        )

        // Configure `numberContainerView`
        numberContainerView.setText(bullet.bullet)

        // If `number` is defined and no value is specified, set the number
        if !numberContainerView.hasText, let number = number {
            numberContainerView.label.text = "\(number)"
        }
    }

    /// Get the index of `self` in its `Section` of other `NumberRow` instances
    ///
    /// - Parameters:
    ///   - indexPath: `IndexPath`
    ///   - section: `Section`
    private func number(
        for indexPath: IndexPath,
        in section: ThunderTable.Section
    ) -> Int? {
        // The `Row`s in this `section`
        let rows = section.rows

        // Index of this `Row`
        let rowIndex = indexPath.row

        // Find the index before the first adjacent `NumberRow` to count from or 0
        var startIndex = rowIndex
        while startIndex > 0 {
            guard rows[startIndex] is Self else { break }
            startIndex -= 1
        }

        return rowIndex - startIndex + 1 // Add 1 due to 0 based index
    }

    // MARK: - CellDisplayable

    func willDisplayCell(
        _ cell: UITableViewCell,
        in tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) {
        guard
            numberFromNeighbourhood,
            let cell = cell as? ListItemTableViewCell,
            let section = tableViewController[indexPath]?.section
        else {
            return
        }

        // Number of the `NumberRow`
        let number = self.number(for: indexPath, in: section) ?? 0

        // `UILabel` to set number text
        let numberContainerView: NumberContainerView? =
            cell.listItemContainerView.listItemView.firstSubviewOfType()

        // Set `text` of `UILabel`
        numberContainerView?.label.text = String(number)
    }
}

// MARK: - NumberContainerView

/// Defined so we can filter by type
class NumberContainerView: LabelContainerView {

    /// Is the `text` of `label` non-empty after trimming
    var hasText: Bool {
        return !(label.text?.trimmed ?? "").isEmpty
    }
}
