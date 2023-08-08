//
//  FusionScaleType.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public enum FusionScaleType: String, Model {

    case scaleToFill
    case aspectFit
    case aspectFill
}

// MARK: - Image + Extensions

public extension Image {

    @ViewBuilder func scaleType(_ scaleType: FusionScaleType) -> some View {
        switch scaleType {
        case .scaleToFill:
            resizable()
        case .aspectFit:
            resizable().scaledToFit()
        case .aspectFill:
            resizable().scaledToFill()
        }
    }
}
