//
//  ModelView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

/// `View` wrapping a `FusionView`
public struct ModelView<Model>: View where Model: FusionView {

    /// `Model`
    public var model: Model

    /// `ActionHandler`
    public var actionHandler: ActionHandler?

    // MARK: - Init

    /// Memberwise initializer
    ///
    /// - Parameters:
    ///   - model: `Model`
    ///   - actionHandler: `ActionHandler`
    public init(model: Model, actionHandler: ActionHandler? = nil) {
        self.model = model
        self.actionHandler = actionHandler
    }

    // MARK: - View

    public var body: some View {
        model.body(actionHandler: actionHandler)
    }
}
