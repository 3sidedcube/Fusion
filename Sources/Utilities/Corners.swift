//
//  Corners.swift
//  Fusion
//
//  Created by Ben Shutt on 18/03/2021.
//

import Foundation
import UIKit

/// Define how set corners on a `CALayer`
public enum Corners {

    /// Set an explicit cornerRadius for the specified corners
    case radius(CGFloat, mask: CACornerMask = .all)

    /// Set cornerRadius relative to `bounds` such that it forms a circle
    case circle
}

// MARK: - CACornerMask

public extension CACornerMask {

    /// All `CACornerMask` at time of writing (the 4 corners)
    static let all: CACornerMask = [
        .layerMaxXMaxYCorner,
        .layerMaxXMinYCorner,
        .layerMinXMaxYCorner,
        .layerMinXMinYCorner
    ]
}

extension CALayer {

    /// Apply `corners` to this instance
    /// 
    /// - Parameter corners: `Corners`
    func setCorners(_ corners: Corners) {
        switch corners {
        case let .radius(cornerRadius, cornerMask):
            setCornerRadius(cornerRadius, mask: cornerMask)
        case .circle:
            setCircularCornerRadius()
        }
    }

    /// Copy corner properties from `layer`
    ///
    /// - Parameter layer: `CALayer`
    func copyCorners(of layer: CALayer) {
        cornerRadius = layer.cornerRadius
        cornerCurve = layer.cornerCurve
        maskedCorners = layer.maskedCorners
    }

    /// Set corner properties on this `CALayer` according to the given `cornerRadius`
    /// and `cornerMask`
    ///
    /// - Parameters:
    ///   - cornerRadius: `CGFloat`
    ///   - cornerMask: `CACornerMask`
    func setCornerRadius(
        _ cornerRadius: CGFloat,
        mask: CACornerMask
    ) {
        self.cornerRadius = cornerRadius
        cornerCurve = .continuous
        maskedCorners = mask
    }

    /// Set corner properties to make this `CALayer` instance circular
    func setCircularCornerRadius() {
        cornerRadius = 0.5 * min(bounds.width, bounds.height)
        cornerCurve = .circular
        maskedCorners = .all
    }
}
