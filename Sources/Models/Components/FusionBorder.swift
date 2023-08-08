//
//  FusionBorder.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct FusionBorder: Model {

    public var color: RGBAHex?
    public var lineWidth: CGFloat?
}

// MARK: - InsettableShape + Extensions

public extension InsettableShape {

    @ViewBuilder func border(_ border: FusionBorder?) -> some View {
        strokeBorder(
            Color(hex: border?.color) ?? .defaultBorderColor,
            lineWidth: border?.lineWidth ?? .defaultBorderLineWidth
        )
    }
}
