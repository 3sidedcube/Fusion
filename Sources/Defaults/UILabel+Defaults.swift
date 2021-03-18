//
//  UILabel+Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `UILabel` defaults
extension UILabel {

    /// Set properties to defaults
    func setDefaults() {
        text = nil
        backgroundColor = .defaultBackgroundColor
        textColor = .defaultTextColor
        textAlignment = .default
        font = .default
        numberOfLines = .defaultNumberOfLines
        lineBreakMode = .default
    }
}
