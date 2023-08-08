//
//  FusionScreen.swift
//  Fusion
//
//  Created by Ben Shutt on 08/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a screen
public struct FusionScreen: FusionModel {

    public var title: String?
    public var screenEvent: String?
    public var subviews: ModelJSON?

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON? { nil }

    public var body: some View {
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

private struct NavigationTitle: ViewModifier {

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
