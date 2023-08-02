//
//  Padding.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct Padding: Model, ViewModifier {

    var leading: Pt?
    var trailing: Pt?
    var top: Pt?
    var bottom: Pt?

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.padding(EdgeInsets(
            top: top ?? .defaultPaddingTop,
            leading: leading ?? .defaultPaddingLeading,
            bottom: bottom ?? .defaultPaddingBottom,
            trailing: trailing ?? .defaultPaddingTrailing
        ))
    }
}

// MARK: - View + Extensions

extension View {

    func padding(_ padding: Padding?) -> some View {
        modifier(padding ?? Padding())
    }
}
