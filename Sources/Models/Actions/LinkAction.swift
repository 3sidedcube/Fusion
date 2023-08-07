//
//  SwiftUIView.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct LinkAction: FusionAction {

    var url: URL
    var inApp: Bool?

    private var isSafari: Bool {
        inApp ?? .defaultLinkInApp
    }

    // MARK: - FusionAction

    func body(content: Content) -> some View {
        if isSafari {
            NavigationLink(value: self) {
                content
            }
        } else {
            Button(action: {
                UIApplication.shared.open(url)
            }, label: {
                content
            })
        }
    }

    func navigationDestination() -> some View {
        SafariView(url: url)
    }
}
