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
