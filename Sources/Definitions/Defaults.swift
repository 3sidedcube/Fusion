//
//  Defaults.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension Color {

    static let defaultTextColor: Color = .black
}

extension FusionTextAlignment {

    static let `default`: FusionTextAlignment = .leading
}

extension FusionFont {

    init() {
        name = nil
        size = 20
        weight = 400
    }
}
