//
//  FusionImage.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Model that draws a SwiftUI `Image` loaded from a `URL`
public struct FusionImage: FusionModel {

    public var url: URL?
    public var scaleType: FusionScaleType?

    public var padding: FusionPadding?
    public var backgroundColor: RGBAHex?
    public var frame: FusionFrame?
    public var cornerRadius: CGFloat?
    public var border: FusionBorder?
    public var shadow: FusionShadow?
    public var margins: FusionPadding?
    public var onTap: ActionJSON?

    // MARK: - View

    public var body: some View {
        Rectangle()
            .fill(.clear)
            .overlay {
                URLImage(
                    url: url,
                    scaleType: scaleType ?? .default
                )
            }
            .view(self)
    }
}

// MARK: - URLImage

private struct URLImage: View {

    var url: URL?
    var scaleType: FusionScaleType

    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image.scaleType(scaleType)
            } else {
                Color.imagePlaceholder
                    .overlay {
                        if phase.error == nil {
                            ProgressView()
                        }
                    }
            }
        }
    }
}

// MARK: - PreviewProvider

struct FusionImage_Previews: PreviewProvider {
    static var previews: some View {
        FusionImage.preview(from: "Image")
    }
}
