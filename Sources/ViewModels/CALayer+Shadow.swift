//
//  CALayer+Shadow.swift
//  MessageStackView
//
//  Created by Ben Shutt on 03/09/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CALayer + SketchShadow

public extension CALayer {

    /// Apply `shadow` to `CALayer`
    ///
    /// - Warning:
    /// This function sets the `shadowPath` based on the `bounds` of the layer
    ///
    /// - Parameter shadow: `Shadow`
    func setShadow(_ shadow: Shadow?) {
        guard let shadow = shadow else {
            shadowColor = UIColor.black.cgColor
            shadowOpacity = 0
            shadowOffset = CGSize(width: 0, height: -3)
            shadowRadius = 3
            shadowPath = nil
            return
        }

        let color = shadow.color?.hexColor ?? .black
        let alpha = shadow.alpha ?? 0
        let width = CGFloat(shadow.x ?? 0)
        let height = CGFloat(shadow.y ?? -3)
        let spread = CGFloat(shadow.spread ?? 0)

        var radius: CGFloat
        if let blur = shadow.blur {
            radius = CGFloat(blur) * 0.5
        } else {
            radius = 3
        }

        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: width, height: height)
        shadowRadius = radius
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(
                roundedRect: rect,
                cornerRadius: cornerRadius
            ).cgPath
        }
    }
}
