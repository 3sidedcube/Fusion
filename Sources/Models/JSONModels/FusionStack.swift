//
//  FusionStack.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionStack: FusionModel {

    var axis: FusionAxis?
    var spacing: CGFloat?
    var isLazy: Bool?
    var subviews: ModelJSON?

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?
    var onTap: ActionJSON?

    // MARK: - Computed

    private var stackAxis: FusionAxis {
        axis ?? .stackDefault
    }

    private var stackSpacing: CGFloat {
        spacing ?? .defaultStackSpacing
    }

    private var isLazyStack: Bool {
        isLazy ?? .defaultStackIsLazy
    }

    // MARK: - View

    var body: some View {
        stack {
            if let subviews = subviews?.array {
                subviews
            }
        }
        .view(self)
    }

    // MARK: - Helper

    @ViewBuilder func stack<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        switch stackAxis {
        case .vertical:
            vStack(content: content)
        case .horizontal:
            hStack(content: content)
        }
    }

    @ViewBuilder func vStack<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        if isLazyStack {
            LazyVStack(alignment: .defaultAlignment, spacing: spacing) {
                content()
            }
        } else {
            VStack(alignment: .defaultAlignment, spacing: spacing) {
                content()
            }
        }
    }

    @ViewBuilder func hStack<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        if isLazyStack {
            LazyHStack(alignment: .defaultAlignment, spacing: spacing) {
                content()
            }
        } else {
            HStack(alignment: .defaultAlignment, spacing: spacing) {
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
