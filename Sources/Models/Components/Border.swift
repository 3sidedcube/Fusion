//
//  Border.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct Border: Model {

    var color: RGBAHex?
    var lineWidth: Pt?
}

// MARK: - InsettableShape + Extensions

extension InsettableShape {

    func border(_ border: Border?) -> some View {
        strokeBorder(
            border?.color?.color ?? .defaultBorderColor,
            lineWidth: border?.lineWidth ?? .defaultBorderLineWidth
        )
    }
}
