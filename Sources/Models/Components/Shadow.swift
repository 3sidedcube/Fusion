//
//  Shadow.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct Shadow: Model, ViewModifier {

    var x: Pt?
    var y: Pt?
    var color: RGBAHex?
    var blur: Pt?
    var spread: Pt? // Unsupported by FigmaShadow

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.shadow(FigmaShadow(
            x: x ?? .defaultShadowX,
            y: y ?? .defaultShadowY,
            blur: blur ?? .defaultShadowBlur,
            color: color?.color ?? .defaultShadowColor
        ))
    }
}

// MARK: - View + Extensions

extension View {

    func shadow(_ shadow: Shadow?) -> some View {
        modifier(shadow ?? Shadow())
    }
}
