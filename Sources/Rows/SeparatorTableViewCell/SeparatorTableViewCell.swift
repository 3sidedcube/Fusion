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
/// `separators` (`Separator`s) property.
///
/// Define `separators` (which conform to `Separator`).
/// These are wrappers around a `CALayer` which will be added as a sublayer to `layer`.
/// When the appropriate lifecycle methods are triggered,  the `separators` receive a message to
/// prepare for the appropriate drawing.
open class SeparatorTableViewCell: UITableViewCell, CellDisplayable {

    /// Get and set `TableSeparator`s
    open var separators = [Separator]() {
        didSet {
            updateSeparators(oldValue: oldValue)
        }
    }

    // MARK: - Init
    override public init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Shared initializer functionality
    open func setup() {
        updateSeparators(oldValue: separators)
    }

    // MARK: - Lifecycle

    override open func prepareForReuse() {
        super.prepareForReuse()
        updateSeparators(oldValue: separators)
    }

    // MARK: - Layout

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateSeparatorsPath()
    }

    // MARK: - Path

    /// Remove each element of `oldValue` and `separators` from its superlayer.
    /// Add `separators` as a sublayer of `layer`.
    /// Update path.
    ///
    /// - Parameter oldValue: `[TableSeparator]`
    private func updateSeparators(oldValue: [Separator]) {
        oldValue.forEach {
            $0.removeFromSuperlayer()
        }
        separators.forEach {
            $0.removeFromSuperlayer()
            layer.addSublayer($0)
        }

        updateSeparatorsPath()
    }

    /// Update the path for each of the `separators`
    private func updateSeparatorsPath() {
        separators.forEach {
            $0.bringToFront()
            $0.updatePath()
        }
    }

    // MARK: - CellDisplayable

    open func willDisplayCell(
        _ cell: UITableViewCell,
        forRowAt indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard !separators.isEmpty else { return }
        layoutIfNeeded() // Ensure `bounds` is set for paths
        updateSeparatorsPath()
    }
}

// MARK: - CALayer+Extensions

extension CALayer {

    /// Remove from `superlayer` and add `self` again as a sublayer
    func bringToFront() {
        guard let superLayer = superlayer else { return }
        removeFromSuperlayer()
        superLayer.addSublayer(self)
    }
}
