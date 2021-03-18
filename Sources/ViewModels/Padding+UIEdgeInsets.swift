//
//  Padding+UIEdgeInsets.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension Padding {

    /// Map this `Padding` instance to `UIEdgeInsets`
    var insets: UIEdgeInsets {
        return UIEdgeInsets(
            top: CGFloat(top),
            left: CGFloat(left),
            bottom: CGFloat(bottom),
            right: CGFloat(right)
        )
    }

    /// Initialize with `insets`
    ///
    /// - Parameter insets: `UIEdgeInsets`
    init(insets: UIEdgeInsets) {
        self.init(
            top: Float(insets.top),
            left: Float(insets.left),
            right: Float(insets.right),
            bottom: Float(insets.bottom)
        )
    }
}
