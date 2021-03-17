//
//  UIButton+Padded.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

extension UIButton: Padded {

    /// Get and set `Padding` by mapping from and to `contentEdgeInsets`
    public var padding: Padding {
        get {
            return Padding(insets: contentEdgeInsets)
        }
        set {
            contentEdgeInsets = newValue.insets
        }
    }
}
