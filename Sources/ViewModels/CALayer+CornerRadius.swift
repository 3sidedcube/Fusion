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
    ///   - cornerCurve: `CALayerCornerCurve`
    func setCornerRadius(
        _ cornerRadius: Float?,
        cornerCurve: CALayerCornerCurve = .continuous
    ) {
        self.cornerRadius = CGFloat(cornerRadius ?? 0)
        self.cornerCurve = cornerCurve
    }
}
