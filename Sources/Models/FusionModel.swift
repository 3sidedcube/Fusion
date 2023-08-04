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
protocol FusionModel: Model, View {

    var padding: FusionPadding? { get }
    var frame: FusionFrame? { get }
    var backgroundColor: RGBAHex? { get }
    var cornerRadius: CGFloat? { get }
    var border: FusionBorder? { get }
    var shadow: FusionShadow? { get }
    var margins: FusionPadding? { get }
    var onTap: ActionJSON? { get }
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

    @MainActor @ViewBuilder func modify<Content: View>(
        _ content: Content
    ) -> some View {
        if let onTap {
            Button(action: {
                Fusion.shared.handle(action: onTap, from: self)
            }, label: {
                modifyView(content)
            })
        } else {
            modifyView(content)
        }
    }

    @MainActor @ViewBuilder private func modifyView<Content: View>(
        _ content: Content
    ) -> some View {
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

    @MainActor func view<Model: FusionModel>(
        _ model: Model
    ) -> some View {
        model.modify(self)
    }
}
