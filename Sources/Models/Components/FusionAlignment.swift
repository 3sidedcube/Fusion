//
//  FusionAlignment.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public enum FusionAlignment: String, Model {

    case topLeading
    case top
    case topTrailing

    case leading
    case center
    case trailing

    case bottomLeading
    case bottom
    case bottomTrailing

    var alignment: Alignment {
        switch self {
        case .topLeading: return .topLeading
        case .top: return .top
        case .topTrailing: return .topTrailing
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        case .bottomLeading: return .bottomLeading
        case .bottom: return .bottom
        case .bottomTrailing: return .bottomTrailing
        }
    }

    var textAlignment: TextAlignment {
        switch self {
        case .topLeading, .leading, .bottomLeading: return .leading
        case .top, .center, .bottom: return .center
        case .topTrailing, .trailing, .bottomTrailing: return .trailing
        }
    }
}
