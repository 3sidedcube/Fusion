//
//  ButtonView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension ButtonModel: FusionView {

    public func body(actionHandler: ActionHandler?) -> some View {
        Button(action: {
            actionHandler?.handle(actionable: self)
        }, label: {
            ModelView(model: self, actionHandler: actionHandler)
        })
    }
}

// MARK: - PreviewProvider

struct ButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        ModelView(model: ButtonModel.sample)
    }
}
