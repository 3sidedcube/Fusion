//  HighlightableView.swift
//  CBIT
//
//  Created by Simon Mitchell on 23/07/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// A `UIView` which conforms to `Highlightable`
class HighlightableView: UIView, Highlightable {

    /// Stores the "real" `backgroundColor` property of the `viewToHighlight`.
    ///
    /// Wrapped around a `Lock` when mutated by `isHighlighted` to store and
    /// return to its original value
    private lazy var backgroundColorLock = Lock<UIColor?>(
        element: viewToHighlight.backgroundColor
    )

    /// Listen for `backgroundColor` set events
    override var backgroundColor: UIColor? {
        didSet {
            backgroundColorLock.setElement(backgroundColor)
        }
    }

    var highlightedColor: UIColor? {
        return .defaultHighlightedColor
    }

    var unhighlightedColor: UIColor? {
        return backgroundColorLock.element
    }

    var isHighlightable: Bool {
        return false
    }

    var viewToHighlight: UIView {
        return self
    }

    var isHighlighted = false {
        didSet {
            backgroundColorLock.setElement(viewToHighlight.backgroundColor)

            if isHighlighted {
                backgroundColorLock.lock()
            } else {
                backgroundColorLock.unlock()
            }

            set(highlighted: isHighlighted, animated: true)
        }
    }

    // MARK: - Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isHighlighted = true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        isHighlighted = false
    }
}
