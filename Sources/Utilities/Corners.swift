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

    /// Set an explicit value for `cornerRadius` and for the given `mask`.
    case radius(CGFloat, mask: CACornerMask = .all)

    /// Set cornerRadius relative to `bounds` such that it forms a circle.
    ///
    /// # Note:
    /// This should be updated every time `bounds` update. This is because the `cornerRadius`
    /// is set to `0.5 * min(bounds.width, bounds.height)`
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

public extension CALayer {

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

    /// Set corner properties on this `CALayer` according to the given `cornerRadius`
    /// and `cornerMask`
    ///
    /// - Parameters:
    ///   - cornerRadius: `CGFloat`
    ///   - cornerMask: `CACornerMask`
    private func setCornerRadius(
        _ cornerRadius: CGFloat,
        mask: CACornerMask
    ) {
        self.cornerRadius = cornerRadius
        cornerCurve = .continuous
        maskedCorners = mask
    }

    /// Set corner properties to make this `CALayer` instance circular
    private func setCircularCornerRadius() {
        cornerRadius = 0.5 * min(bounds.width, bounds.height)
        cornerCurve = .circular
        maskedCorners = .all
    }
}
