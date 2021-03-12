//
//  Row+RowActionable.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation
import ThunderTable

extension Row where Self: RowActionable {

    /// Handle the given `actionJSON`
    ///
    /// - Parameter actionJSON: `ActionJSON`
    @discardableResult
    func handleAction(_ actionJSON: ActionJSON?) throws -> Bool {
        guard let action = try actionJSON?.toAction() else { return false }
        actionHandler?.handleAction(action)
        return true
    }

    /// Execute `handleAction(_:)` returning `false` on throw
    ///
    /// - Parameter actionJSON: `ActionJSON`
    @discardableResult
    func tryHandleAction(_ actionJSON: ActionJSON?) -> Bool {
        return (try? handleAction(actionJSON)) ?? false
    }
}
