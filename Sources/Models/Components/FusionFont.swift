//
//  FusionFont.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct FusionFont: Model {

    var name: String?
    var size: Pt?
    var weight: Int?

    // MARK: Computed

    /// Map `font` to `Font.Name`
    var fontName: Font.Name {
        guard let fontName = name else { return .default }
        return .custom(fontName)
    }
}
