//
//  FusionScaleType.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

enum FusionScaleType: Model {

    case scaleToFill
    case aspectFit
    case aspectFill

    var contentMode: ContentMode {
        switch self {
        case .scaleToFill: return .fill
        case .aspectFit: return .fit
        case .aspectFill: return .fill
        }
    }
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
