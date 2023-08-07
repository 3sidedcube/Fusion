//
//  Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension Bool {
    static let defaultIsMarkdown = false
    static let defaultShowsIndicators = true
    static let defaultLinkInApp = true
    static let defaultStackIsLazy = true
}

extension Int {
    static let defaultFontWeight = 400
}

extension CGFloat {
    static let defaultFontSize: CGFloat = 20
    static let defaultLetterSpacing: CGFloat = 0

    static let defaultCornerRadius: CGFloat = 0
    static let defaultBorderLineWidth: CGFloat = 2

    static let defaultShadowX: CGFloat = 0
    static let defaultShadowY: CGFloat = 0
    static let defaultShadowBlur: CGFloat = 0

    static let defaultPaddingTop: CGFloat = 0
    static let defaultPaddingLeading: CGFloat = 0
    static let defaultPaddingBottom: CGFloat = 0
    static let defaultPaddingTrailing: CGFloat = 0

    static let defaultStackSpacing: CGFloat = 0
}

extension Color {
    static let defaultTextColor: Color = .black

    static let defaultBackgroundColor: Color = .white.opacity(0)
    static let defaultBorderColor: Color = .white.opacity(0)

    static let defaultShadowColor: Color = .black.opacity(0)

    static let imagePlaceholder = Color(white255: 200)
}

extension Font.Name {
    static let `default`: Font.Name = .system
}

extension FusionAlignment {
    static let `default`: FusionAlignment = .center
}

extension FusionScaleType {
    static let `default`: FusionScaleType = .aspectFill
}

extension JSONDecoder {
    static let `default` = JSONDecoder()
}

extension FusionAxis {
    static let scrollDefault: FusionAxis = .vertical
    static let stackDefault: FusionAxis = .vertical
}

extension HorizontalAlignment {
    static let defaultAlignment: HorizontalAlignment = .center
}

extension VerticalAlignment {
    static let defaultAlignment: VerticalAlignment = .center
}
