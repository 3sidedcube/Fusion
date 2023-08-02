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

extension CGFloat {
    static let defaultFontSize: CGFloat = 20

    static let defaultCornerRadius: CGFloat = 0
    static let defaultBorderLineWidth: CGFloat = 2

    static let defaultShadowX: CGFloat = 0
    static let defaultShadowY: CGFloat = 0
    static let defaultShadowBlur: CGFloat = 0

    static let defaultPaddingLeading: CGFloat = 0
    static let defaultPaddingTrailing: CGFloat = 0
    static let defaultPaddingTop: CGFloat = 0
    static let defaultPaddingBottom: CGFloat = 0
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
