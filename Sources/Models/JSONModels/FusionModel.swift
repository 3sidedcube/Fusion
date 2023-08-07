//
//  FusionModel.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// A `Model` which renders a SwiftUI `View`.
/// All entities have the properties of a `FusionView`.
///
/// This entity should be understood as both a `View` and a `ViewModifier`.
/// We don't conform to `ViewModifier` to prioritize `View` conformance.
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

    @MainActor var action: (any ViewModifier)? {
        guard let onTap else { return nil }
        return try? Fusion.shared.viewModifier(for: onTap)
    }

    // MARK: - ViewModifier

    @ViewBuilder private func update(_ content: some View) -> some View {
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

    @MainActor @ViewBuilder func modify(_ content: some View) -> some View {
        if let action {
            update(content)
                .modify(with: action)
                .erased()
        } else {
            update(content)
        }
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
