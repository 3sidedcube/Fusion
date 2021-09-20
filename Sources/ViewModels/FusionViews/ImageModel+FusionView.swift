//
//  ImageView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI
import Kingfisher

extension ImageModel: FusionView {

    public func body(actionHandler: ActionHandler?) -> some View {
        Group {
            if let url = url {
                KFImage.url(url)
                    .resizable()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .viewModel(self)
            } else {
                EmptyView()
            }
        }
    }
}

// MARK: - PreviewProvider

struct ImageModel_Previews: PreviewProvider {
    static var previews: some View {
        return ModelView(model: ImageModel.sample)
    }
}
