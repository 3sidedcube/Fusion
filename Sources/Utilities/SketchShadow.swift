//
//  SketchShadow.swift
//  Fusion
//
//  Created by Ben Shutt on 15/03/2021.
//

import Foundation
import UIKit

/// Model based on Sketch shadow properties.
public struct SketchShadow {

    /// Shadow color
    public var color: UIColor

    /// Shadow opacity
    public var alpha: Float

    /// Shadow offset in x
    public var x: CGFloat

    /// Shadow offset in y
    public var y: CGFloat

    /// Shadow blur (2 * shadow radius)
    public var blur: CGFloat

    /// Shadow spread
    public var spread: CGFloat

    // MARK: - Init

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - color: `UIColor`
    ///   - alpha: `Float`
    ///   - x: `CGFloat`
    ///   - y: `CGFloat`
    ///   - blur: `CGFloat`
    ///   - spread: `CGFloat`
    public init(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat
    ) {
        self.color = color
        self.alpha = alpha
        self.x = x
        self.y = y
        self.blur = blur
        self.spread = spread
    }
}

// MARK: - Default

public extension SketchShadow {

    /// `SketchShadow` with the default shadow properties
    static var `default`: SketchShadow {
        return SketchShadow(color: .black, alpha: 0, x: 0, y: -3, blur: 6, spread: 0)
    }
}

// MARK: - CALayer + SketchShadow

public extension CALayer {

    /// Apply `sketchShadow` to `CALayer`
    ///
    /// - Warning:
    /// This function sets the `shadowPath` based on the `bounds` of the layer
    ///
    /// - Parameter sketchShadow: `SketchShadow`
    func setSketchShadow(_ sketchShadow: SketchShadow) {
        shadowColor = sketchShadow.color.cgColor
        shadowOpacity = sketchShadow.alpha
        shadowOffset = CGSize(width: sketchShadow.x, height: sketchShadow.y)
        shadowRadius = sketchShadow.blur * 0.5
        if sketchShadow.spread == 0 {
            shadowPath = nil
        } else {
            let dx = -sketchShadow.spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(
                roundedRect: rect,
                cornerRadius: cornerRadius
            ).cgPath
        }
    }
}
