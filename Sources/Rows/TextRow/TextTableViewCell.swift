//
//  TextTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` with a `LabelContainerView`
open class TextTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return LabelContainerView()
    }

    // swiftlint:disable force_cast
    open var labelContainerView: LabelContainerView {
        return subview as! LabelContainerView
    }
    // swiftlint:enable force_cast

    // MARK: - Shorthand

    open var label: InsetLabel {
        return labelContainerView.label
    }
}
