//
//  PageAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct PageAction: FusionAction {

    var url: URL

    // MARK: - FusionAction

    func body(content: Content) -> some View {
        NavigationLink(value: self) {
            content
        }
    }

    func navigationDestination() -> some View {
        JSONView(url: url)
    }
}
