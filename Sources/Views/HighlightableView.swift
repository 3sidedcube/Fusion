//  HighlightableView.swift
//  CBIT
//
//  Created by Simon Mitchell on 23/07/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

class HighlightableView: UIView, Highlightable {

    var highlightedColor: UIColor = .defaultHighlightedColor
    var unhighlightedColor: UIColor = .defaultUnhighlightedColor
    var isHighlightable = true
    var viewToHighlight: UIView { return self }

    // MARK: - Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        set(highlighted: true, animated: false)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        set(highlighted: false, animated: false)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        set(highlighted: false, animated: false)
    }
}
