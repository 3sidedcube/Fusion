//
//  File.swift
//  
//
//  Created by Ben Shutt on 09/09/2021.
//

import Foundation
import SwiftUI

extension EdgeInsets {

    /// Initialize with zero components
    static var zero: EdgeInsets {
        return .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }

    /// Set all properties: `top`, `leading`, `bottom`, `trailing` to the same given `value`
    ///
    /// - Parameter value: Fixed value for all properties
    init(value: CGFloat) {
        self.init(top: value, leading: value, bottom: value, trailing: value)
    }

    /// Sum `leading` and `trailing`
    var horizontalSum: CGFloat {
        return leading + trailing
    }

    /// Sum `top` and `bottom`
    var verticalSum: CGFloat {
        return top + bottom
    }
}
