//
//  InsetsModel.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Model of inset properties
///
/// - Note:
/// Margins and padding have the same structure, but differ in purpose:
/// - Padding: Inset of own content relative to itself - e.g. text inset from its own text container
/// - Margins: Inset relative to other views - e.g. inset of self relative to its superview
public struct InsetsModel: Codable {

    /// Top padding
    public var top: Points

    /// Left padding
    public var left: Points

    /// Right padding
    public var right: Points

    /// Bottom padding
    public var bottom: Points
}

// MARK: - Extensions

public extension InsetsModel {

    /// Initialize with zero components
    static let zero = InsetsModel(top: 0, left: 0, right: 0, bottom: 0)
}
