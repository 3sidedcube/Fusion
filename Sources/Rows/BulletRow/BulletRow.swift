//
//  BulletRow.swift
//  Fusion
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
open class BulletRow: ListItemRow {

    /// Define how the number of the `BulletRow` is determined.
    ///
    /// - Note:
    /// If text has already been specified by the model, then do not overwrite.
    public enum NumberStyle {

        /// No attempt made to set the number of the `BulletRow` instance.
        case none

        /// Define the number of the `BulletRow` instance explicitly.
        case explicit(Int)

        /// Calculate the number of the `BulletRow` instance  by working out its position
        /// in the neighbourhood of other adjacent `BulletRow`s.
        case neighbourhood
    }

    /// `Bullet` model to drive UI
    public let bullet: Bullet

    /// Define a `NumberStyle`
    open var numberStyle: NumberStyle = .neighbourhood

    /// Initialize with `bullet`
    ///
    /// - Parameter bullet: `Bullet`
    public init(bullet: Bullet) {
        self.bullet = bullet
        super.init(listItem: bullet.listItem)
    }

    // MARK: - Row

    override open func configureCell(
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
        let numberContainerViews: [NumberContainerView] =
            listItemView.subviewsOfTypeRecursive()
        numberContainerViews.forEach { $0.removeFromSuperview() }

        // Create a `NumberContainerView` instance and add to UI
        let numberContainerView = NumberContainerView()
        listItemView.hStackView.insertArrangedSubview(numberContainerView, at: 0)

        // Configure `numberContainerView`
        numberContainerView.setText(bullet.bullet)

        // If `number` is defined and no value is specified, set the number
        if case .explicit(let number) = numberStyle, !numberContainerView.hasText {
            numberContainerView.label.text = "\(number)"
        }
    }

    /// Get the index of `self` in its `Section` of other `BulletRow` instances
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

        // Find the index before the first adjacent `BulletRow` to count from or 0
        var startIndex = rowIndex
        while startIndex > 0 {
            guard rows[startIndex] is Self else { break }
            startIndex -= 1
        }

        return rowIndex - startIndex + 1 // Add 1 due to 0 based index
    }

    // MARK: - CellDisplayable

    override open func willDisplayCell(
        _ cell: ListItemTableViewCell,
        forRowAt indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard
            case .neighbourhood = numberStyle,
            let section = tableViewController[indexPath]?.section
        else {
            return
        }

        // Number of the `BulletRow`
        let number = self.number(for: indexPath, in: section) ?? 0

        // `UILabel` to set number text
        guard let numberContainerView: NumberContainerView =
                cell.listItemContainerView.listItemView.firstSubviewOfType() else {
            return
        }

        // Ensure we are not overwriting text
        guard !numberContainerView.hasText else { return }

        // Set `text` of `UILabel`
        numberContainerView.label.text = String(number)
    }
}

// MARK: - NumberContainerView

/// Defined so we can filter by type
open class NumberContainerView: LabelContainerView {

    /// Shared initialization code
    override open func setup() {
        super.setup()

        label.setContent(
            hugging: 800,
            compressionResistance: 800,
            axis: [.horizontal, .vertical]
        )
    }

    /// Is the `text` of `label` non-empty after trimming
    open var hasText: Bool {
        return !(label.text?.trimmed ?? "").isEmpty
    }
}
