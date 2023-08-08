//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `Rectangle` which shared properties
struct FusionView: FusionModel {

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?
    var onTap: ActionJSON?

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(.clear)
            .view(self)
    }
}

// MARK: - PreviewProvider

struct FusionView_Previews: PreviewProvider {
    static var previews: some View {
        FusionView.preview(from: "View")
    }
}
