//
//  ImageTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` with a `ImageContainerView`
class ImageTableViewCell: ContainerTableViewCell {

    override func createSubview() -> UIView {
        return ImageContainerView()
    }

    // swiftlint:disable force_cast
    var imageContainerView: ImageContainerView {
        return subview as! ImageContainerView
    }
    // swiftlint:enable force_cast
}
