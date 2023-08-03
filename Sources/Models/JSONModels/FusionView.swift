//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionView: Model, View {

    var backgroundColor: RGBAHex?
    var cornerRadius: CGFloat?
    var padding: FusionPadding?
    var shadow: FusionShadow?
    var border: FusionBorder?
    var frame: FusionFrame?

    // MARK: - View

    var body: some View {
        Rectangle()
            .padding(padding)
            .background(backgroundColor?.color ?? .defaultBackgroundColor)
            .frame(frame)
            .cornerRadius(cornerRadius ?? .defaultCornerRadius)
            // .border(border)
            .compositingGroup()
            .shadow(shadow)
    }
}
