//
//  FusionTextStyle.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct FusionTextStyle: Model, ViewModifier {

    var name: String?
    var size: Pt?
    var weight: Int?
    var lineHeight: Px?
    var letterSpacing: Px?

    // MARK: - Computed

    private var fontName: Font.Name {
        guard let fontName = name else { return .default }
        return .custom(fontName)
    }

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.style(TextStyle(
            fontName,
            weight: .init(integer: weight ?? .defaultFontWeight),
            size: size ?? .defaultFontSize,
            lineHeight: lineHeight ?? size ?? .defaultFontSize,
            letter: letterSpacing ?? 1, // TODO!
            underline: false
        ))
    }
}

// MARK: - View + Extensions

extension View {

    func textStyle(_ textStyle: FusionTextStyle?) -> some View {
        modifier(textStyle ?? FusionTextStyle())
    }
}
