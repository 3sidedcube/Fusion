//
//  FusionShadow.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct FusionShadow: Model, ViewModifier {

    var x: CGFloat?
    var y: CGFloat?
    var color: RGBAHex?
    var blur: CGFloat?
    var spread: CGFloat? // Unsupported by FigmaShadow

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.shadow(FigmaShadow(
            x: x ?? .defaultShadowX,
            y: y ?? .defaultShadowY,
            blur: blur ?? .defaultShadowBlur,
            color: Color(hex: color) ?? .defaultShadowColor
        ))
    }
}

// MARK: - View + Extensions

extension View {

    func shadow(_ shadow: FusionShadow?) -> some View {
        modifier(shadow ?? FusionShadow())
    }
}
