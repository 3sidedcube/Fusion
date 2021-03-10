//
//  CALayer+CornerRadius.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

extension CALayer {

    /// Set `cornerRadius`
    ///
    /// - Parameter cornerRadius: `Float`
    func setCornerRadius(_ cornerRadius: Float?) {
        self.cornerRadius = CGFloat(cornerRadius ?? 0)
        cornerCurve = .continuous
    }
}
