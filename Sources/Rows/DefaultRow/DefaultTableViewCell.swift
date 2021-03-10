//
//  DefaultTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` which a title, subtitle, and leading container `UIView`
class DefaultTableViewCell: SeparatorTableViewCell, Highlightable {

    /// `DefaultView`
    @IBOutlet private(set) var defaultView: DefaultView!

    /// `containerView` of `defaultView`
    var containerView: UIView {
        return defaultView.containerView
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        updateHighlighted()
        selectedBackgroundView = UIView()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        set(highlighted: highlighted, animated: animated)
    }

    // MARK: - Highlightable

    var viewToHighlight: UIView {
        return containerView
    }
}
