//
//  ButtonTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` with a `ButtonContainerView`
open class ButtonTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return ButtonContainerView()
    }

    // swiftlint:disable force_cast
    open var buttonContainerView: ButtonContainerView {
        return subview as! ButtonContainerView
    }
    // swiftlint:enable force_cast

    // MARK: - Shorthand

    open var button: UIButton {
        return buttonContainerView.button
    }
}
