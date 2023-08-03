//
//  FusionModel.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// A `Model` which has the properties of a `FusionView`.
///
/// This entity should be understood as a `ViewModifier`, but we don't
/// conform to it here so that we don't interfere with `View` conformance.
protocol FusionModel: Model {

    var padding: FusionPadding? { get }
    var frame: FusionFrame? { get }
    var backgroundColor: RGBAHex? { get }
    var cornerRadius: CGFloat? { get }
    var border: FusionBorder? { get }
    var shadow: FusionShadow? { get }
    var margins: FusionPadding? { get }
}

// MARK: - Extensions

private extension FusionModel {

    var background: Color {
        backgroundColor?.color ?? .defaultBackgroundColor
    }

    var corner: CGFloat {
        cornerRadius ?? .defaultCornerRadius
    }

    // MARK: - ViewModifier

    @ViewBuilder func modify<Content: View>(_ content: Content) -> some View {
        content
            .padding(padding)
            .frame(frame)
            .background(background)
            .cornerRadius(corner)
            .clipped()
            .overlay {
                RoundedRectangle(cornerRadius: corner)
                    .border(border)
            }
            .compositingGroup()
            .shadow(shadow)
            .padding(margins)
    }
}

// MARK: - View + Extensions

extension View {

    func view<Model: FusionModel>(_ model: Model) -> some View {
        model.modify(self)
    }
}
