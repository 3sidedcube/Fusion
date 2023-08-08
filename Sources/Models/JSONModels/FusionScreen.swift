//
//  FusionScreen.swift
//  Fusion
//
//  Created by Ben Shutt on 08/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a screen
struct FusionScreen: FusionModel {

    var title: String?
    var screenEvent: String?
    var subviews: ModelJSON?

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?
    var onTap: ActionJSON? { nil }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.defaultScreenBackgroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .view(self)

            if let subviews = subviews?.array {
                subviews
            }
        }
        .modifier(NavigationTitle(title: title))
        .onAppear {
            guard let screenEvent else { return }
            guard !Fusion.shared.handle(screenEvent: screenEvent) else { return }
            Fusion.shared.log("Screen event '\(screenEvent)' not handled")
        }
    }
}

// MARK: - NavigationTitle

struct NavigationTitle: ViewModifier {

    var title: String?

    func body(content: Content) -> some View {
        if let title {
            content.navigationTitle(title)
        } else {
            content
        }
    }
}

// MARK: - PreviewProvider

struct FusionScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FusionScreen.preview(from: "Screen")
        }
    }
}
