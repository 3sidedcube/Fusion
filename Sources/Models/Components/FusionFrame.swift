//
//  FusionFrame.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Construct a frame for a view.
struct FusionFrame: Model, ViewModifier {

    var width: CGFloat?
    var height: CGFloat?

    func body(content: Content) -> some View {
        content
            .frame(width: width?.value, height: height?.value)
            .frame(maxWidth: width?.maxValue, maxHeight: height?.maxValue)
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

extension View {

    func frame(_ frame: FusionFrame?) -> some View {
        modifier(frame ?? FusionFrame())
    }
}
