//
//  FusionTextAlignment.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

enum FusionTextAlignment: String, Model {

    case leading
    case center
    case trailing

    /// Map to `Alignment`
    var alignment: Alignment {
        switch textAlignment {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }

    /// Map to `TextAlignment`
    var textAlignment: TextAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
}
