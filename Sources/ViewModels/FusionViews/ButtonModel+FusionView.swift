//
//  ButtonView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension ButtonModel: View {

    public var body: some View {
        Button(action: {
            Fusion.shared.handle(actionable: self)
        }, label: {
            self
        })
    }
}

// MARK: - PreviewProvider

struct ButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModel.sample
    }
}
