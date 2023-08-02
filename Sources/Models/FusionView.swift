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
    var cornerRadius: Pt?
    var padding: Padding?
    var shadow: Shadow?
    var border: Border?
    var size: Size?

    // MARK: - View

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius ?? .defaultCornerRadius)
            .border(border)
            .background(backgroundColor?.color ?? .defaultBackgroundColor)
            .size(size)
            .cornerRadius(cornerRadius ?? .defaultCornerRadius)
            .shadow(shadow)
            .padding(padding)
    }
}
