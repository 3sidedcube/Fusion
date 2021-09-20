//
//  Text+FontModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {

    /// Apply `fontModel`
    ///
    /// - Parameter fontModel: `FontModel`
    /// - Returns: `View`
    func fontModel(_ fontModel: FontModel) -> some View {
        let view = font(fontModel.font)
        guard case .italic = fontModel.weightCase else { return view }
        return view.italic()
    }
}
