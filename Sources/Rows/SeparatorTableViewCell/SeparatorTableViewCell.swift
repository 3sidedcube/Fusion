//
//  SeparatorTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

// MARK: - SeparatorTableViewCell

/// Sometimes the provided separators on a `UITableViewCell` are not enough.
/// `SeparatorTableViewCell` allows us to stroke custom paths according to the
/// `separators` (`TableSeparator`s) property.
///
/// How it works:
/// Define `separators` (which are `TableSeparator`s).
/// These are wrappers around a `CAShapeLayer` which will be added as a sublayer
/// to `layer`. They are also are responsible for how the path of this layer is drawn.
/// When calling `updatePath()`, the `separators` are asked to update their path
/// (the path of the `CAShapeLayer`).
class SeparatorTableViewCell: UITableViewCell, CellDisplayable {

    /// Get and set `TableSeparator`s
    var separators = [TableSeparator]() {
        didSet {
            updateSeparators(oldValue: oldValue)
        }
    }

    // MARK: - Init

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        updateSeparators(oldValue: separators)
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        updateSeparators(oldValue: separators)
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }

    // MARK: - Path

    /// Remove each element of `oldValue` and `separators` from its superlayer.
    /// Add `separators` as a sublayer of `layer`.
    /// Update path.
    ///
    /// - Parameter oldValue: `[TableSeparator]`
    private func updateSeparators(oldValue: [TableSeparator]) {
        oldValue.forEach {
            $0.removeFromSuperlayer()
        }
        separators.forEach {
            $0.removeFromSuperlayer()
            $0.addToLayer(layer: layer)
        }

        updatePath()
    }

    /// Update the path for each of the `separators`
    func updatePath() {
        separators.forEach {
            $0.bringToFront()
            $0.updatePath()
        }
    }

    // MARK: - CellDisplayable

    func willDisplayCell(
        _ cell: UITableViewCell,
        forRowAt indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard !separators.isEmpty else { return }
        layoutIfNeeded() // Path using bounds
        updatePath()
    }
}
