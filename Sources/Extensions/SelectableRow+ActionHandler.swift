//
//  SelectableRow+ActionHandler.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

extension SelectableRow {

    /// Set the `selectionHandler` to handle the `actionJSON` by passing on
    /// the `Action` to the `actionHandler`
    ///
    /// - Parameter actionJSON: `ActionJSON`
    mutating func setSelectionHandlerForActionJSON(_ actionJSON: ActionJSON) {
        selectionHandler = { row, _, _, _ in
            guard let actionable = row as? RowActionable else { return }
            guard let action = try? actionJSON.toAction() else { return }
            actionable.actionHandler?.handleAction(action)
        }
    }
}
