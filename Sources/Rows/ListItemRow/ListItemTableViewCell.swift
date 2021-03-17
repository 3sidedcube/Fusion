//
//  ListItemTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit
import ThunderTable

/// `UITableViewCell` with a `ListItemContainerView`
class ListItemTableViewCell: ContainerTableViewCell {

    override func createSubview() -> UIView {
        return ListItemContainerView()
    }

    // swiftlint:disable force_cast
    var listItemContainerView: ListItemContainerView {
        return subview as! ListItemContainerView
    }
    // swiftlint:enable force_cast

    override func setup() {
        super.setup()
    }
}
