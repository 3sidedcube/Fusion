//
//  LineHeight+ViewModifier.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension LineHeight: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .lineSpacing(lineHeight - fontModel.legacyFont.lineHeight)
            // .padding(.vertical, (lineHeight - fontModel.legacyFont.lineHeight) / 2) // TODO
    }
}

// MARK: - View + LineHeight

extension View {
    func lineHeight(_ lineHeight: LineHeight) -> some View {
        modifier(lineHeight)
    }
}
