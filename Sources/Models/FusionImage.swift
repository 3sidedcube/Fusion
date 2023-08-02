//
//  FusionImage.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionImage: Model, View {

    var url: URL?
    var scaleType: FusionScaleType?

    // MARK: - View

    var body: some View {
        AsyncImage(url: url) { image in
            image.scaleType(scaleType ?? .default)
        } placeholder: {
            Color.imagePlaceholder
        }
        .clipped()
    }
}
