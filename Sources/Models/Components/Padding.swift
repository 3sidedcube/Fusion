//
//  Padding.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Padding of a view or content - maps to `UIEdgeInsets`
public struct Padding: Codable {

    /// Top padding
    public var top: Float

    /// Left padding
    public var left: Float

    /// Right padding
    public var right: Float

    /// Bottom padding
    public var bottom: Float
}

// MARK: - Margins

/// `Margins` and `Padding` have the same structure, but differences are in purpose:
/// - `Padding`: Inset of own content relative to itself - e.g. text inset from its own text container
/// - `Margins`: Inset relative to other views - e.g. inset of self relative to its superview
public typealias Margins = Padding

// MARK: - Extensions

public extension Padding {

    /// `Padding` with components set to `0`
    static let zero = Padding(top: 0, left: 0, right: 0, bottom: 0)
}