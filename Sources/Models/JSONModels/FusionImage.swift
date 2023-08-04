//
//  FusionImage.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct FusionImage: FusionModel, View {

    var url: URL?
    var scaleType: FusionScaleType?

    // MARK: View

    var padding: FusionPadding?
    var backgroundColor: RGBAHex?
    var frame: FusionFrame?
    var cornerRadius: CGFloat?
    var border: FusionBorder?
    var shadow: FusionShadow?
    var margins: FusionPadding?
    var onTap: ActionJSON?

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(.clear)
            .overlay {
                AsyncImage(url: url) { image in
                    image.scaleType(scaleType ?? .default)
                } placeholder: {
                    Color.imagePlaceholder
                }
            }
            .view(self)
    }
}

// MARK: - PreviewProvider

struct FusionImage_Previews: PreviewProvider {
    static var previews: some View {
        FusionImage.preview(from: "Image")
    }
}
