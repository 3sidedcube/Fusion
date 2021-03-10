//
//  ImageTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// A `UITableViewCell` with a single `UIImageView` contained in a `UIView`
class ImageTableViewCell: UITableViewCell {

    /// `UIView` container of `UIImageView`
    @IBOutlet private(set) var imageContainerView: ImageContainerView!
}
