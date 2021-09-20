//
//  Actionable.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An entity with an `ActionJSON`
protocol Actionable {

    /// `ActionJSON`
    var action: ActionJSON? { get }
}

// MARK: - Extensions

extension Actionable {

    /// Map `ActionJSON` to `Action` masking any throws
    func toAction() -> Action? {
        return try? action?.toAction() // Mask error
    }
}

// MARK: - ActionHandler + Actionable

extension ActionHandler {

    /// Handle the given `actionable`
    ///
    /// - Parameter actionable: `Actionable`
    /// - Returns: `Bool`
    @discardableResult
    func handle(actionable: Actionable) -> Bool {
        guard let action = actionable.toAction() else { return false }
        return handleAction(action)
    }
}
