//
//  PageView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftyJSON

extension Page: View, ActionHandler {

    public func handleAction(_ action: Action) -> Bool {
        return false
    }

    public var body: some View {
        List {
            ForEach(jsonModels) { jsonModel in
                ModelView(model: jsonModel, actionHandler: self)
            }
        }
    }
}

extension JSONModel: FusionView {

    // TODO
    public func body(actionHandler: ActionHandler?) -> some View {
        if let jsonModel = try? toJSONModel() {
            if let view = Fusion.shared.viewForModel(jsonModel) {
                return view
            } else if fusionView = jsonModel as? FusionView {
                return ModelView(model: fusionView, actionHandler: actionHandler)
            }
        }

        return EmptyView()
    }
}

// MARK: - Page + JSONModel

private extension Page {

    /// Get `JSONModel` components
    var jsonModels: [JSONModel] {
        return screen?.children.array?.compactMap { try? $0.toJSONModel() } ?? []
    }
}
