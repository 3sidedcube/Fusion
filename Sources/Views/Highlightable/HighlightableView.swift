//  HighlightableView.swift
//  CBIT
//
//  Created by Simon Mitchell on 23/07/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// A `UIView` which conforms to `Highlightable`
class HighlightableView: UIView, Highlightable {

    // MARK: - Highlightable

    /// Toggle whether highlighting behavior is enabled
    var isHighlightable = true

    /// Set `highlighted` state
    ///
    /// - Parameters:
    ///   - highlighted: `Bool`
    ///   - animated: `Bool`
    func setHighlighted(_ highlighted: Bool, animated: Bool) {
        guard isHighlightable else { return }
        UIView.animate(withDuration: animated ? 0.2 : 0.0) {
            if highlighted {
                self.backgroundColorLock.lock()
                self.backgroundColor = .defaultHighlightedColor
            } else {
                self.backgroundColorLock.unlock()
                self.backgroundColor = self.backgroundColorLock.element
            }
        }
    }

    /// Stores the "real" `backgroundColor` property of the `viewToHighlight`.
    ///
    /// Wrapped around a `Lock` when mutated by `isHighlighted` to store and
    /// return to its original value
    private lazy var backgroundColorLock = Lock<UIColor?>(element: backgroundColor)

    /// Listen for `backgroundColor` set events
    override var backgroundColor: UIColor? {
        didSet {
            backgroundColorLock.setElement(backgroundColor)
        }
    }

    // MARK: - Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setHighlighted(true, animated: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setHighlighted(false, animated: true)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setHighlighted(false, animated: true)
    }
}
