//
//  FusionSize.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionSize: Model, ViewModifier {

    var width: CGFloat?
    var height: CGFloat?

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.frame(width: width, height: height)
    }
}

// MARK: - View + Extensions

extension View {

    func size(_ size: FusionSize?) -> some View {
        modifier(size ?? FusionSize())
    }
}
