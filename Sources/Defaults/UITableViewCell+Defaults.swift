//
//  UITableViewCell+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `UITableViewCell` defaults
extension UITableViewCell {

    /// Set default properties
    func setDefaults() {
        backgroundColor = .defaultCellBackgroundColor
        contentView.backgroundColor = backgroundColor
    }
}
