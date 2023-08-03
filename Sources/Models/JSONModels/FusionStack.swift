//
//  FusionStack.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct FusionStack: FusionModel, View {

    var axis: FusionAxis?
    var spacing: CGFloat?
    var subviews: JSON?

    // MARK: View

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?

    // MARK: - Computed

    private var stackAxis: FusionAxis {
        axis ?? .default
    }

    private var stackSpacing: CGFloat {
        spacing ?? .defaultStackSpacing
    }

    // MARK: - View

    var body: some View {
        stackView {
            if let subviews = subviews?.array {
                ForEach(
                    Array(subviews.enumerated()),
                    id: \.offset
                ) { _, subview in
                    Fusion.shared.erasedView(for: subview)
                }
            }
        }
        .view(self)
    }

    @ViewBuilder func stackView<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        switch stackAxis {
        case .vertical:
            VStack(alignment: .center, spacing: spacing) {
                content()
            }
        case .horizontal:
            VStack(alignment: .center, spacing: spacing) {
                content()
            }
        }
    }
}

// MARK: - PreviewProvider

struct FusionStack_Previews: PreviewProvider {
    static var previews: some View {
        FusionStack.preview(from: "Stack")
    }
}
