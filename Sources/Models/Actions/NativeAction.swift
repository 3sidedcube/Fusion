//
//  NativeAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct NativeAction: Model, ViewModifier {

    var id: String

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        Button(action: {
            Fusion.shared.handleNativeAction(id: id, from: content)
        }, label: {
            content
        })
    }
}
