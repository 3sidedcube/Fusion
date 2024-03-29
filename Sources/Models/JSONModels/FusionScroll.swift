//
//  FusionScroll.swift
//  Fusion
//
//  Created by Ben Shutt on 04/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `ScrollView`
public struct FusionScroll: FusionModel {

    public var axis: FusionAxis?
    public var showsIndicators: Bool?
    public var subviews: ModelJSON?

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON? { nil }

    // MARK: - Init

    public init(
        axis: FusionAxis? = nil,
        showsIndicators: Bool? = nil,
        subviews: ModelJSON? = nil,
        padding: FusionPadding? = nil,
        backgroundColor: RGBAHex? = nil,
        frame: FusionFrame? = nil,
        cornerRadius: CGFloat? = nil,
        border: FusionBorder? = nil,
        shadow: FusionShadow? = nil,
        margins: FusionPadding? = nil
    ) {
        self.axis = axis
        self.showsIndicators = showsIndicators
        self.subviews = subviews
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.border = border
        self.shadow = shadow
        self.margins = margins
    }

    // MARK: - Computed

    private var scrollAxis: FusionAxis {
        axis ?? .scrollDefault
    }

    // MARK: - View

    public var body: some View {
        ScrollView(
            scrollAxis.axis,
            showsIndicators: showsIndicators ?? .defaultShowsIndicators
        ) {
            if let subviews = subviews?.array {
                subviews
            }
        }
        .view(self)
    }
}

// MARK: - PreviewProvider

struct FusionScroll_Previews: PreviewProvider {
    static var previews: some View {
        FusionScroll.preview(from: "Scroll")
    }
}
