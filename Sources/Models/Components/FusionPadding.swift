//
//  FusionPadding.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct FusionPadding: Model, ViewModifier {

    public var top: CGFloat?
    public var leading: CGFloat?
    public var bottom: CGFloat?
    public var trailing: CGFloat?

    // MARK: - Init

    public init(
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        bottom: CGFloat? = nil,
        trailing: CGFloat? = nil
    ) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    // MARK: - ViewModifier

    public func body(content: Content) -> some View {
        content.padding(EdgeInsets(
            top: top ?? .defaultPaddingTop,
            leading: leading ?? .defaultPaddingLeading,
            bottom: bottom ?? .defaultPaddingBottom,
            trailing: trailing ?? .defaultPaddingTrailing
        ))
    }
}

// MARK: - View + Extensions

public extension View {

    func padding(_ padding: FusionPadding?) -> some View {
        modifier(padding ?? FusionPadding())
    }
}
