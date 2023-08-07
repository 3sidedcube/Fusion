//
//  NativeAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct NativeAction: FusionAction {

    var id: String

    // MARK: - FusionAction

    func body(content: Content) -> some View {
        Button(action: {
            guard !Fusion.shared.handleNativeAction(id: id) else { return }
            Fusion.shared.log("NativeAction with id=\(id) not handled")
        }, label: {
            content
        })
    }
}
