//
//  FusionScaleType.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

enum FusionScaleType: String, Model {

    case scaleToFill
    case aspectFit
    case aspectFill
}

// MARK: - Image + Extensions

extension Image {

    @ViewBuilder func scaleType(_ scaleType: FusionScaleType) -> some View {
        switch scaleType {
        case .scaleToFill:
            scaledToFill()
        case .aspectFit:
            resizable().scaledToFit()
        case .aspectFill:
            resizable().scaledToFill()
        }
    }
}