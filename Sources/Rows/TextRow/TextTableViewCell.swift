//
//  TextTableViewCell.swift
//  CBIT
//
//  Created by Ben Shutt on 25/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit

/// Simple `UITableViewCell` with a `label` inset from the `contentView`
class TextTableViewCell: UITableViewCell {

    /// The `LabelContainerView`
    @IBOutlet private(set) var labelContainerView: LabelContainerView!
}
