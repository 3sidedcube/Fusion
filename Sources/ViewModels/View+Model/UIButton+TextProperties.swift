//
//  UIButton+TextProperties.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {

    /// Set the given `textProperties`
    ///
    /// - Parameter textProperties: `TextProperties`
    func setTextProperties(_ textProperties: TextProperties?) {
        setAttributedTitle(textProperties?.attributedString, for: .normal)

        // `numberOfLines`
        titleLabel?.numberOfLines = textProperties?.numberOfLines ?? .defaultNumberOfLines
    }
}
