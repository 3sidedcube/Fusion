//
//  PageAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

struct PageAction: Model, ViewModifier {

    var url: URL

    func body(content: Content) -> some View {
        NavigationLink {
            JSONView(url: url)
        } label: {
            content
        }
    }
}
