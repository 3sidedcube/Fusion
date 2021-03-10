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
class TableSeparator {

    // MARK: - Position

    /// Position of a `TableSeparator`
    enum Position: Int {

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

    /// Width of the stroked path
    /// - Note:
    /// If a cell above has a `RewardTierSeparator` at the bottom and this cell
    /// has a `RewardTierSeparator` the stroke width will be the sum of the 2.
    var strokeWidth: CGFloat {
        didSet {
            updateStrokeWidth()
        }
    }

    /// Color of the stroked path
    var strokeColor: UIColor {
        didSet {
            updateStrokeColor()
        }
    }

    /// `Position` to draw path relative to `shapeLayer.superlayer`
    var position: Position {
        didSet {
            updatePath()
        }
    }

    /// `UIBezierPath` of `shapeLayer`'s path
    var path: UIBezierPath? {
        get {
            if let path = shapeLayer.path {
                return UIBezierPath(cgPath: path)
            }
            return nil
        }
        set {
            shapeLayer.path = newValue?.cgPath
        }
    }

    /// `CALayer` `superlayer` of `shapeLayer`
    var superlayer: CALayer? {
        return shapeLayer.superlayer
    }

    // MARK: - Init

    init (
        position: Position,
        strokeWidth: CGFloat = 1,
        strokeColor: UIColor = .lightGray
    ) {
        self.position = position
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor

        updateStrokeColor()
        updateStrokeWidth()
        resetPath()
    }

    // MARK: - Layer

    func addToLayer(layer: CALayer) {
        layer.addSublayer(shapeLayer)
        updatePath()
    }

    func removeFromSuperlayer() {
        shapeLayer.removeFromSuperlayer()
    }

    func bringToFront() {
        if let superlayer = shapeLayer.superlayer {
            removeFromSuperlayer()
            addToLayer(layer: superlayer)
        }
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
    func resetPath() {
        path = UIBezierPath()
    }

    /// Update the path of `shapeLayer`, based on the metrics of
    /// its superlayer
    func updatePath() {
        guard let superlayer = shapeLayer.superlayer else {
            return
        }

        let width = superlayer.bounds.width
        let height = superlayer.bounds.height

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
