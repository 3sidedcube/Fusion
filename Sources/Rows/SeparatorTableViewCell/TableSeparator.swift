//
//  TableSeparator.swift
//  CBIT
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// Wrap a `CAShapeLayer` for drawing a separator in a `UITableViewCell`
open class TableSeparator {

    // MARK: - Position

    /// Position of a `TableSeparator`
    public enum Position: Int {

        /// Top of a `UIView`
        case top

        /// Bottom of a `UIView`
        case bottom

        /// Both top and bottom
        static var both: [Position] = [.top, .bottom]
    }

    /// Separator layer for stroke path
    private lazy var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1.0
        return shapeLayer
    }()

    /// `CGFloat` width of the stroked path
    open var strokeWidth: CGFloat {
        didSet {
            updateStrokeWidth()
        }
    }

    /// `UIColor` of the stroked path
    open var strokeColor: UIColor {
        didSet {
            updateStrokeColor()
        }
    }

    /// `Position` to draw path relative to `shapeLayer.superlayer`
    open var position: Position {
        didSet {
            updatePath()
        }
    }

    /// `UIBezierPath` of `shapeLayer`'s path
    open var path: UIBezierPath? {
        get {
            guard let path = shapeLayer.path else { return nil }
            return UIBezierPath(cgPath: path)
        }
        set {
            shapeLayer.path = newValue?.cgPath
        }
    }

    // MARK: - Init

    public init (
        position: Position,
        strokeWidth: CGFloat = 1,
        strokeColor: UIColor = .defaultSeparatorColor
    ) {
        self.position = position
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor

        updateStrokeColor()
        updateStrokeWidth()
        resetPath()
    }

    // MARK: - Layer

    open func addToLayer(layer: CALayer) {
        layer.addSublayer(shapeLayer)
        updatePath()
    }

    open func removeFromSuperlayer() {
        shapeLayer.removeFromSuperlayer()
    }

    open func bringToFront() {
        guard let superlayer = shapeLayer.superlayer else { return }
        removeFromSuperlayer()
        addToLayer(layer: superlayer)
    }

    // MARK: - Update

    private func updateStrokeWidth() {
        shapeLayer.lineWidth = strokeWidth
    }

    private func updateStrokeColor() {
        shapeLayer.strokeColor = strokeColor.cgColor
    }

    // MARK: - Path

    /// Reset the path of the layer
    open func resetPath() {
        path = UIBezierPath()
    }

    /// Update the path of `shapeLayer`, based on the `bounds` of its parent layer
    open func updatePath() {
        guard let superLayer = shapeLayer.superlayer else { return }

        let width = superLayer.bounds.width
        let height = superLayer.bounds.height

        let path = UIBezierPath()

        let y: CGFloat
        switch position {
        case .top:
            y = strokeWidth * 0.5
        case .bottom:
            y = height - strokeWidth * 0.5
        }

        path.strokeLine(width: width, y: y)
        self.path = path
    }
}

// MARK: UIBezierPath + Path

private extension UIBezierPath {

    /// Stroke solid horizontal line
    ///
    /// - Parameters:
    ///   - width: `CGFloat` canvas width
    ///   - y: y coordinate to draw horizontally along (draw along x for fixed y)
    func strokeLine(
        width: CGFloat,
        y: CGFloat
    ) {
        move(to: CGPoint(x: 0, y: y))
        addLine(to: CGPoint(x: width, y: y))
    }
}
