//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `Rectangle` which shared properties
public struct FusionView: FusionModel {

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON?

    // MARK: - View

    public var body: some View {
        Rectangle()
            .fill(.clear)
            .view(self)
    }
}

// MARK: - PreviewProvider

struct FusionView_Previews: PreviewProvider {
    static var previews: some View {
        FusionView.preview(from: "View")
    }
}
