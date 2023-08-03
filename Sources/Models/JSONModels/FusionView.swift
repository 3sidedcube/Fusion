//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionView: Model, View {

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?

    // MARK: - Computed

    var background: Color {
        backgroundColor?.color ?? .defaultBackgroundColor
    }

    var corner: CGFloat {
        cornerRadius ?? .defaultCornerRadius
    }

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(.clear)
            .padding(padding)
            .background(background)
            .frame(frame)
            .cornerRadius(corner)
            .overlay {
                RoundedRectangle(cornerRadius: corner)
                    .border(border)
            }
            .clipped()
            .compositingGroup()
            .shadow(shadow)
            .padding(margins)
    }
}

// MARK: - PreviewProvider

struct FusionView_Previews: PreviewProvider {
    static var previews: some View {
        FusionView.preview(from: "View")
    }
}
