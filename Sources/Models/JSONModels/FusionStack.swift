//
//  FusionStack.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `VStack` or `HStack`
public struct FusionStack: FusionModel {

    public var axis: FusionAxis?
    public var spacing: CGFloat?
    public var isLazy: Bool?
    public var subviews: ModelJSON?

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON?

    // MARK: - Init

    public init(
        axis: FusionAxis? = nil,
        spacing: CGFloat? = nil,
        isLazy: Bool? = nil,
        subviews: ModelJSON? = nil,
        padding: FusionPadding? = nil,
        backgroundColor: RGBAHex? = nil,
        frame: FusionFrame? = nil,
        cornerRadius: CGFloat? = nil,
        border: FusionBorder? = nil,
        shadow: FusionShadow? = nil,
        margins: FusionPadding? = nil,
        onTap: ActionJSON? = nil
    ) {
        self.axis = axis
        self.spacing = spacing
        self.isLazy = isLazy
        self.subviews = subviews
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.border = border
        self.shadow = shadow
        self.margins = margins
        self.onTap = onTap
    }

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

    public var body: some View {
        stack {
            if let subviews = subviews?.array {
                subviews
            }
        }
        .view(self)
    }

    // MARK: - ViewBuilders

    @ViewBuilder private func stack<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        switch stackAxis {
        case .vertical:
            vStack(content: content)
        case .horizontal:
            hStack(content: content)
        }
    }

    @ViewBuilder private func vStack<Content: View>(
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

    @ViewBuilder private func hStack<Content: View>(
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
