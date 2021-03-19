//
//  ImageTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// `UITableViewCell` with a `ImageContainerView`
open class ImageTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return ImageContainerView()
    }

    // swiftlint:disable force_cast
    open var imageContainerView: ImageContainerView {
        return subview as! ImageContainerView
    }
    // swiftlint:enable force_cast

    // MARK: - Shorthand

    open var cellImageView: AdjustableImageView {
        return imageContainerView.imageView
    }
}
