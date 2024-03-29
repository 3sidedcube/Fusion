//
//  FusionFrame.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Construct a frame for a view.
public struct FusionFrame: Model, ViewModifier {

    public var width: CGFloat?
    public var height: CGFloat?
    public var alignment: FusionAlignment?

    // MARK: - Init

    public init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        alignment: FusionAlignment? = nil
    ) {
        self.width = width
        self.height = height
        self.alignment = alignment
    }

    // MARK: - Computed

    private var frameAlignment: Alignment {
        (alignment ?? .default).alignment
    }

    func alignment(_ alignment: FusionAlignment?) -> Self {
        var frame = self
        frame.alignment = alignment
        return frame
    }

    public func body(content: Content) -> some View {
        content
            .frame(
                width: width?.value,
                height: height?.value,
                alignment: frameAlignment
            )
            .frame(
                maxWidth: width?.maxValue,
                maxHeight: height?.maxValue,
                alignment: frameAlignment
            )
    }
}

// MARK: - CGFloat + Extensions

private extension CGFloat {

    var value: CGFloat? {
        self < 0 ? nil : self
    }

    var maxValue: CGFloat? {
        self < 0 ? .infinity : nil
    }
}

// MARK: - View + Extensions

public extension View {

    func frame(_ frame: FusionFrame?) -> some View {
        modifier(frame ?? FusionFrame())
    }
}
