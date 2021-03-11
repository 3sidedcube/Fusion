//
//  TextTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` with a `LabelContainerView`
class TextTableViewCell: ContainerTableViewCell {

    override class func createSubview() -> UIView {
        return LabelContainerView()
    }

    // swiftlint:disable force_cast
    var labelContainerView: LabelContainerView {
        return subview as! LabelContainerView
    }
    // swiftlint:enable force_cast
}
