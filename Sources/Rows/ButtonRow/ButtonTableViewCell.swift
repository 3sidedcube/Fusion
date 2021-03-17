//
//  ButtonTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
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
}
