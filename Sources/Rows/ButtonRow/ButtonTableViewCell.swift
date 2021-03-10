//
//  ButtonTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import UIKit

class ButtonTableViewCell: UITableViewCell, Highlightable {

    /// `ButtonContainerView`
    @IBOutlet private(set) var buttonContainerView: ButtonContainerView!

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
        return buttonContainerView.button
    }
}
