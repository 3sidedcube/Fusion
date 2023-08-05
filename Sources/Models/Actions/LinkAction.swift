//
//  SwiftUIView.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct LinkAction: Model, ViewModifier {

    var url: URL
    var inApp: Bool?

    private var isSafari: Bool {
        inApp ?? .defaultLinkInApp
    }

    func body(content: Content) -> some View {
        if isSafari {

        } else {

        }
    }
}
