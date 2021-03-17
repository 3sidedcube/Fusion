//
//  DividerTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import UIKit

/// `UITableViewCell` with a `DividerContainerView`
open class DividerTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return DividerContainerView()
    }

    // swiftlint:disable force_cast
    open var dividerContainerView: DividerContainerView {
        return subview as! DividerContainerView
    }
    // swiftlint:enable force_cast
}
