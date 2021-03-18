//
//  UITableViewCell+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `UITableViewCell` defaults
extension UITableViewCell {

    /// Set default properties
    func setDefaults() {
        backgroundColor = .defaultBackgroundColor
        contentView.backgroundColor = backgroundColor
    }
}
