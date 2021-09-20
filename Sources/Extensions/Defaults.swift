import Foundation
import SwiftUI
import CoreGraphics

extension Color {

    static var defaultTextColor: Color {
        return .black
    }

    static var defaultBackgroundColor: Color {
        return .clear
    }

    static var defaultBorderColor: Color {
        return .clear
    }
}

extension Points {

    static var defaultFontSize: Points {
        return 17
    }

    static var defaultCornerRadius: Points {
        return 0
    }

    static var defaultBorderStrokeWidth: Points {
        return 0
    }

    static var defaultLetterSpacing: Points {
        return 0
    }

    static func defaultLineHeight(for font: LegacyFont) -> Points {
        return font.pointSize
    }

    static var defaultImageSpacing: Points {
        return 0
    }

    static var defaultTextSpacing: Points {
        return 0
    }

    static var defaultDividerHeight: Points {
        return 0
    }
}

extension FontModel.Weight {

    static var defaultFontWeight: FontModel.Weight {
        return .regular
    }
}

extension InsetsModel {

    static var defaultPadding: InsetsModel {
        return .zero
    }
}

extension FontModel {

    static var defaultFontModel: FontModel {
        return FontModel(name: nil, weight: nil, size: nil)
    }
}

extension Font {

    static func defaultFont(size: Points, weight: FontModel.Weight) -> Font {
        return .system(size: size, weight: weight.weight, design: .default)
    }
}

extension TextAlignment {

    static var defaultTextAlignment: TextAlignment {
        return .leading
    }
}
