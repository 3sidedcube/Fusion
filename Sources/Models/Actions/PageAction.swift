//
//  PageAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct PageAction: Model, ViewModifier {

    var url: URL

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        NavigationLink(value: self) {
            content
        }
    }

    // MARK: - FusionAction

    func navigationDestination() -> some View {
        JSONView(url: url)
    }
}
