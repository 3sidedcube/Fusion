//
//  FusionAxis.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

enum FusionAxis: String, Model {

    case vertical
    case horizontal

    var axis: Axis.Set {
        switch self {
        case .vertical: return [.vertical]
        case .horizontal: return [.horizontal]
        }
    }
}
