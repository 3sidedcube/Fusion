//
//  ListItemTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit
import ThunderTable

/// `UITableViewCell` with a `ListItemContainerView`
open class ListItemTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return ListItemContainerView()
    }

    // swiftlint:disable force_cast
    open var listItemContainerView: ListItemContainerView {
        return subview as! ListItemContainerView
    }
    // swiftlint:enable force_cast
}
