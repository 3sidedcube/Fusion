//
//  Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension Int {
    static let defaultFontWeight = 400
}

extension Pt {
    static let defaultFontSize: Pt = 20

    static let defaultCornerRadius: Pt = 0
    static let defaultBorderLineWidth: Pt = 2

    static let defaultShadowX: Pt = 0
    static let defaultShadowY: Pt = 0
    static let defaultShadowBlur: Pt = 0

    static let defaultPaddingLeading: Pt = 0
    static let defaultPaddingTrailing: Pt = 0
    static let defaultPaddingTop: Pt = 0
    static let defaultPaddingBottom: Pt = 0
}

extension Color {
    static let defaultTextColor: Color = .black

    static let defaultBackgroundColor: Color = .clear
    static let defaultBorderColor: Color = .clear

    static let defaultShadowColor: Color = .black
}

extension Font.Name {
    static let `default`: Font.Name = .system
}

extension FusionTextAlignment {
    static let `default`: FusionTextAlignment = .leading
}
