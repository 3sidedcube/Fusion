//
//  Highlightable.swift
//  CBIT
//
//  Created by Ben Shutt on 19/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

// MARK: - Highlightable

/// A protocol which allows anything to be "highlighted"
protocol Highlightable: AnyObject {

    /// Returns the view to have the highlight applied to it
    var viewToHighlight: UIView { get }

    /// The background colour of the view when highlighted
    var highlightedColor: UIColor { get }

    /// The colour of the view when not highlighted
    var unhighlightedColor: UIColor { get }

    /// Whether the view updates it's UI on highlightable events
    var isHighlightable: Bool { get }
}

// MARK: - Extensions

extension Highlightable {

    var highlightedColor: UIColor {
        return .defaultHighlightedColor
    }

    var unhighlightedColor: UIColor {
        return .defaultUnhighlightedColor
    }

    var isHighlightable: Bool {
        return true
    }

    /// Sets the component as highlighted if `isHighlightable` is `true`.
    ///
    /// # Note:
    /// Function name differs to standard here to avoid conflicts with `UITableViewCell`.
    ///
    /// - Parameters:
    ///   - highlighted: Whether the component is highlighted
    ///   - animated: Whether to animate the change
    func set(highlighted: Bool, animated: Bool) {
        // If `isHighlightable` is disabled do nothing
        guard isHighlightable else { return }
        UIView.animate(withDuration: animated ? 0.2 : 0.0) { [weak self] in
            guard let self = self else { return }
            let color = highlighted ? self.highlightedColor : self.unhighlightedColor
            self.viewToHighlight.backgroundColor = color
        }
    }
}

// MARK: - Highlightable + UITableViewCell

extension Highlightable where Self: UITableViewCell {

    /// Update highlighted according to `isHighlighted` property
    /// - Parameter animated: `Bool`
    func updateHighlighted(animated: Bool = false) {
        set(highlighted: isHighlighted, animated: animated)
    }
}

// MARK: - Highlightable + UICollectionViewCell

extension Highlightable where Self: UICollectionViewCell {

    /// Update highlighted according to `isHighlighted` property
    /// - Parameter animated: `Bool`
    func updateHighlighted(animated: Bool = false) {
        set(highlighted: isHighlighted, animated: animated)
    }
}

// MARK: - Highlightable + Row

extension Highlightable where Self: Row {

    /// By default, a `Row` is `isHighlightable` when the `selectionHandler` is defined
    var isHighlightable: Bool {
        return selectionHandler != nil
    }
}
