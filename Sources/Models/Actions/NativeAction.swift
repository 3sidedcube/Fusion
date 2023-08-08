//
//  NativeAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// An action model which notifies the `Fusion` that an action was performed
public struct NativeAction: FusionAction {

    public var id: String

    // MARK: - Init

    public init(id: String) {
        self.id = id
    }

    // MARK: - FusionAction

    public func body(content: Content) -> some View {
        Button(action: {
            guard !Fusion.shared.handle(nativeAction: id) else { return }
            Fusion.shared.log("Native action '\(id)' not handled")
        }, label: {
            content
        })
    }
}
