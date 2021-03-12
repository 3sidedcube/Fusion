//
//  NumberRow.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A `ListItemRow` where the `UIView` inside the leading container `UIView` is a `UILabel`
/// with a number.
///
/// This might be used for, say, a numbered list in a CMS `Article`.
/// Each `Row` represents 1 list item.
class NumberRow: ListItemRow, CellDisplayable {

    /// Provide an explicit number.
    /// Otherwise fallback to `Row` index in `Section` adding 1.
    var number: Int?

    // MARK: - Row

    override func configureCell(
        _ cell: ListItemTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        super.configureCell(cell, at: indexPath, in: tableViewController)

        // NumberLabel
        let label = NumberLabel()
        label.setContent(
            hugging: 800,
            compressionResistance: 801,
            axis: [.horizontal, .vertical]
        )

        // leadingContainerView
        let numberContainerView = cell.numberContainerView
        numberContainerView.isHidden = false
        numberContainerView.backgroundColor = .clear
        numberContainerView.layer.setShadow(nil)
        numberContainerView.layer.setBorder(nil)
        numberContainerView.layer.setCornerRadius(nil)
        numberContainerView.padding = .zero
        numberContainerView.margins = .zero
        numberContainerView.removeSubviewsRecursive()
        numberContainerView.addSubview(label)

        // Constrain
        label.edgeConstraints(to: numberContainerView)
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true

        // Separators
        cell.separators = [TableSeparator(position: .bottom, strokeWidth: 2)]
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
            guard rows[startIndex] is NumberRow else { break }
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
        let sectionRow = tableViewController[indexPath]
        guard
            let cell = cell as? ListItemTableViewCell,
            let row = sectionRow?.row as? NumberRow,
            let section = sectionRow?.section
        else {
            return
        }

        // `UILabel` to set number text
        let numberLabel: NumberLabel? = cell.numberContainerView.firstSubviewOfType()

        // Number of the `NumberRow`
        let number = row.number ?? self.number(for: indexPath, in: section) ?? 0

        // Set `text` of `UILabel`
        numberLabel?.text = String(number)
    }
}

// MARK: - ListItemTableViewCell + Container

private extension ListItemTableViewCell {

    var numberContainerView: ImageContainerView {
        return listItemContainerView.listItemView.imageContainerView
    }
}