//
//  View+ViewModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: Margins currently not supported

// MARK: - Defaults

private extension ViewModel {

    var backgroundColorOrDefault: Color {
        return backgroundColor?.hexColor ?? .defaultBackgroundColor
    }

    var paddingOrDefault: InsetsModel {
        return padding ?? .defaultPadding
    }

    var borderColorOrDefault: Color {
        return border?.color?.hexColor ?? .defaultBorderColor
    }

    var borderWidthOrDefault: Points {
        return border?.strokeWidth ?? .defaultBorderStrokeWidth
    }

    var sketchShadowOrDefault: SketchShadow {
        return shadow?.sketchShadow ?? .default
    }

    var cornerRadiusOrDefault: Points {
        return cornerRadius ?? .defaultCornerRadius
    }
}

// MARK: - ViewModifier

extension View {

    /// Apply `viewModel`
    ///
    /// - Parameter viewModel: `ViewModel`
    /// - Returns: `View`
    public func viewModel(_ viewModel: ViewModel) -> some View {
        return self
            .background(viewModel.backgroundColorOrDefault)
            .padding(viewModel.paddingOrDefault.insets)
            .overlay(
                RoundedRectangle(cornerRadius: viewModel.cornerRadiusOrDefault)
                    .stroke(
                        viewModel.borderColorOrDefault,
                        lineWidth: viewModel.borderWidthOrDefault
                    )
            )
            .sketchShadow(viewModel.sketchShadowOrDefault)
    }
}
