//
//  CALayer+CornerRadius.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

public extension CALayer {

    /// Set `cornerRadius`
    ///
    /// - Parameters:
    ///   - cornerRadius: `Float`
    func setCornerRadius(_ cornerRadius: Float?) {
        setCorners(.radius(CGFloat(cornerRadius ?? 0)))
    }
}
