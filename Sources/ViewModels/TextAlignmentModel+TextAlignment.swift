//
//  TextAlignmentModel+TextAlignment.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension TextAlignmentModel {

    /// Map to `TextAlignment`
    var textAlignment: TextAlignment {
        switch self {
        case .left: return .leading
        case .right: return .trailing
        case .center: return .center
        }
    }
}
