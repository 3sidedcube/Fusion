//
//  FusionAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

// TODO: View needs to navigate actions

protocol FusionAction: Model, ViewModifier {
    associatedtype Destination: View

    @ViewBuilder func navigationDestination() -> Destination
}

extension FusionAction {

    /// By default, return empty view
    @ViewBuilder func navigationDestination() -> some View {}
}

extension View {

    func navigate<Action: FusionAction>(_ action: Action) -> some View {
        navigationDestination(for: Action.self) { action in
            action.navigationDestination()
        }
    }
}
