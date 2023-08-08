//
//  FusionShadow.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

public struct FusionShadow: Model, ViewModifier {

    public var x: CGFloat?
    public var y: CGFloat?
    public var color: RGBAHex?
    public var blur: CGFloat?
    public var spread: CGFloat? // Unsupported by FigmaShadow

    // MARK: - Init

    public init(
        x: CGFloat? = nil,
        y: CGFloat? = nil,
        color: RGBAHex? = nil,
        blur: CGFloat? = nil,
        spread: CGFloat? = nil
    ) {
        self.x = x
        self.y = y
        self.color = color
        self.blur = blur
        self.spread = spread
    }

    // MARK: - ViewModifier

    public func body(content: Content) -> some View {
        content.shadow(FigmaShadow(
            x: x ?? .defaultShadowX,
            y: y ?? .defaultShadowY,
            blur: blur ?? .defaultShadowBlur,
            color: Color(hex: color) ?? .defaultShadowColor
        ))
    }
}

// MARK: - View + Extensions

public extension View {

    func shadow(_ shadow: FusionShadow?) -> some View {
        modifier(shadow ?? FusionShadow())
    }
}
