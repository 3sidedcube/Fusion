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
