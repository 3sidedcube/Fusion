//
//  UIEdgeInsets+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension UIEdgeInsets {

    /// Set all properties: `top`, `left`, `bottom`, `right` to the same given `value`
    ///
    /// - Parameter value: Fixed value for all properties
    init (value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }

    /// Sum `left` and `right`
    var horizontalSum: CGFloat {
        return left + right
    }

    /// Sum `top` and `bottom`
    var verticalSum: CGFloat {
        return top + bottom
    }
}
