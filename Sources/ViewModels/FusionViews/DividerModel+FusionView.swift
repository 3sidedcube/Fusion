//
//  DividerView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension DividerModel: View {

    public var body: some View {
        Divider()
            .frame(idealHeight: strokeWidthOrDefault)
            .viewModel(self)
    }
}

// MARK: - Defaults

private extension DividerModel {

    /// `strokeWidth` or default
    var strokeWidthOrDefault: Points {
        return strokeWidth ?? .defaultDividerHeight
    }
}


// MARK: - PreviewProvider

struct DividerModel_Previews: PreviewProvider {
    static var previews: some View {
        DividerModel.sample
    }
}
