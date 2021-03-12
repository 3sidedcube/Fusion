//
//  DividerTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import UIKit

/// `UITableViewCell` with a `DividerContainerView`
class DividerTableViewCell: ContainerTableViewCell {

    override func createSubview() -> UIView {
        return DividerContainerView()
    }

    // swiftlint:disable force_cast
    var dividerContainerView: DividerContainerView {
        return subview as! DividerContainerView
    }
    // swiftlint:enable force_cast
}
