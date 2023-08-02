//
//  FusionBorder.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionBorder: Model {

    var color: RGBAHex?
    var lineWidth: CGFloat?
}

// MARK: - InsettableShape + Extensions

extension InsettableShape {

    @ViewBuilder func border(_ border: FusionBorder?) -> some View {
        strokeBorder(
            border?.color?.color ?? .defaultBorderColor,
            lineWidth: border?.lineWidth ?? .defaultBorderLineWidth
        )
    }
}
