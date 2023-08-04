//
//  FusionScroll.swift
//  Fusion
//
//  Created by Ben Shutt on 04/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct FusionScroll: FusionModel, View {

    var axis: FusionAxis?
    var showsIndicators: Bool?
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

    private var scrollAxis: FusionAxis {
        axis ?? .scrollDefault
    }

    // MARK: - View

    var body: some View {
        ScrollView(
            scrollAxis.axis,
            showsIndicators: showsIndicators ?? .defaultShowsIndicators
        ) {
            if let subviews = subviews?.array {
                ForEach(subviews) { subview in
                    Fusion.shared.erasedView(for: subview)
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct FusionScroll_Previews: PreviewProvider {
    static var previews: some View {
        FusionScroll.preview(from: "Scroll")
    }
}
