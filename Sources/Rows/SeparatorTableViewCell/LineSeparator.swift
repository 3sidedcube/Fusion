//
//  LineSeparator.swift
//  Fusion
//
//  Created by Ben Shutt on 17/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// Wrap a `CAShapeLayer` for drawing a horizontal separator relative to its `superlayer`
open class LineSeparator: CAShapeLayer, Separator {

    /// Position to draw/stroke `LineSeparator` relative to its `superlayer`
    public enum Position: Int {

        /// Stroke line along the top of parent `CALayer`
        case top

        /// Stroke line along the bottom of parent `CALayer`
        case bottom

        /// Both `.top` and `.bottom`
        static var both: [Position] = [.top, .bottom]
    }

    /// `Position` to draw `path` relative to `superlayer`
    open var linePosition: Position {
        didSet {
            updatePath()
        }
    }

    /// `path` mapped to and from `UIBezierPath`
    open var linePath: UIBezierPath? {
        get {
            guard let path = path else { return nil }
            return UIBezierPath(cgPath: path)
        }
        set {
            path = newValue?.cgPath
        }
    }

    /// `strokeColor` mapped to and from `UIColor`
    open var lineStrokeColor: UIColor? {
        get {
            guard let cgColor = strokeColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            strokeColor = newValue?.cgColor
        }
    }

    // MARK: - Init

    /// Initialize instance
    ///
    /// - Parameters:
    ///   - position: `Position`
    ///   - strokeWidth: `CGFloat`
    ///   - strokeColor: `UIColor`
    public init (
        position: Position,
        strokeWidth: CGFloat = 1,
        strokeColor: UIColor = .defaultSeparatorColor
    ) {
        // Set properties
        linePosition = position

        // Initialize `super`
        super.init()

        // Fire set properties
        lineWidth = strokeWidth
        lineStrokeColor = strokeColor

        // Set defaults
        fillColor = UIColor.clear.cgColor
        strokeStart = 0.0
        strokeEnd = 1.0

        // Update `path`
        updatePath()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Separator

    /// Update the `path` relative to the `bounds` of `superlayer`
    open func updatePath() {
        guard let superlayer = superlayer else {
            linePath = UIBezierPath()
            return
        }

        // Dimensions of `superLayer` `bounds` to draw relative to
        let width = superlayer.bounds.width
        let height = superlayer.bounds.height

        // `UIBezierPath` to draw
        let path = UIBezierPath()

        // Get `y` coordinate for stroked line
        let y: CGFloat
        switch linePosition {
        case .top:
            y = lineWidth * 0.5
        case .bottom:
            y = height - lineWidth * 0.5
        }

        // Stroke solid horizontal line
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: width, y: y))

        linePath = path
    }
}
