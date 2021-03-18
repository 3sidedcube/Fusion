//  HighlightableView.swift
//  CBIT
//
//  Created by Simon Mitchell on 23/07/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// A `UIView` which conforms to `Highlightable`
open class HighlightableView: UIView, Highlightable {

    /// Toggle whether highlighting behavior is enabled
    open var isHighlightable = true

    /// Set color to highlight
    open var highlightedColor: UIColor = .defaultHighlightedColor

    /// Stores the "real" `backgroundColor` property of the `viewToHighlight`.
    ///
    /// Wrapped around a `Lock` when mutated by `isHighlighted` to store and
    /// return to its original value
    public private(set) lazy var backgroundColorLock =
        Lock<UIColor?>(element: backgroundColor)

    /// Listen for `backgroundColor` set events
    override open var backgroundColor: UIColor? {
        didSet {
            // Set element of `backgroundColorLock` unless it is locked
            backgroundColorLock.setElement(backgroundColor)
        }
    }

    // MARK: - Highlightable

    /// Set `highlighted` state
    ///
    /// - Parameters:
    ///   - highlighted: `Bool`
    ///   - animated: `Bool`
    open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        guard isHighlightable else { return }
        UIView.animate(withDuration: animated ? 0.2 : 0.0) {
            self.backgroundColorLock.isLocked = highlighted
            if highlighted {
                self.backgroundColor = self.highlightedColor
            } else {
                self.backgroundColor = self.backgroundColorLock.element
            }
        }
    }

    // MARK: - Touches

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setHighlighted(true, animated: true)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setHighlighted(false, animated: true)
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setHighlighted(false, animated: true)
    }
}
