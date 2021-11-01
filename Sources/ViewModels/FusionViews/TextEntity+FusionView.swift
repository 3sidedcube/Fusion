//
//  TextView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension TextEntity {

    public var body: some View {
        Text(contentOrDefault)
            .kerning(letterSpacingOrDefault)
            .fontModel(fontModelOrDefault)
            .lineHeight(toLineHeight())
            .foregroundColor(textColorOrDefault)
            .multilineTextAlignment(textAlignmentOrDefault)
            .lineLimit(numberOfLines)
            .viewModel(self)
    }
}

// MARK: - Defaults

private extension TextEntity {

    /// `content` or default
    var contentOrDefault: String {
        return content ?? ""
    }

    /// `letterSpacing` or default
    var letterSpacingOrDefault: Points {
        return letterSpacing ?? .defaultLetterSpacing
    }

    /// `font` or default
    var fontModelOrDefault: FontModel {
        return font ?? .defaultFontModel
    }

    /// `LineHeight`
    func toLineHeight() -> LineHeight {
        let fontModel = fontModelOrDefault
        let lineHeight = lineHeight ?? .defaultLineHeight(for: fontModel.legacyFont)
        return LineHeight(fontModel: fontModel, lineHeight: lineHeight)
    }

    /// `textColor` or default
    var textColorOrDefault: Color {
        return textColor?.hexColor ?? .defaultTextColor
    }

    /// `textAlignment` or default
    var textAlignmentOrDefault: TextAlignment {
        return textAlignment?.textAlignment ?? .defaultTextAlignment
    }
}

// MARK: - PreviewProvider

struct TextEntity_Previews: PreviewProvider {
    static var previews: some View {
        TextModel.sample
    }
}
