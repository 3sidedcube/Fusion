//
//  FusionAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// A `Model` decoded from an `ActionJSON` which modifies a SwiftUI `View`.
protocol FusionAction: Model, ViewModifier {

    /// A view that is navigated to
    associatedtype Destination: View

    /// If this action navigates to another view via a `NavigationLink`, return
    /// the `Destination` for that action.
    @ViewBuilder func navigationDestination() -> Destination
}

// MARK: - Extensions

extension FusionAction {

    /// By default, returns an empty view
    @ViewBuilder func navigationDestination() -> some View {}
}

// MARK: - View + Extensions

extension View {

    /// Add a navigation destination for all the actions on the shared `Fusion`
    /// - Returns: `View`
    @MainActor func navigateFusionActions() -> some View {
        ForEach(Array(Fusion.shared.actions), id: \.0) { _, type in
            navigationDestination(for: type) { action in
                action.navigationDestination().erased()
            }
            .erased()
        }
    }
}
