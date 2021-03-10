//
//  UIImageView+Image.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit
import Kingfisher

extension ImageContainerView {

    /// Set the given `image`
    ///
    /// - Parameters:
    ///   - image: `Image`
    ///   - completion: `ImageCompletion`
    func setImage(_ image: inout Image, completion: ImageCompletion?) {
        // `backgroundColor`
        backgroundColor = image.backgroundColor?.hexColor ?? .clear

        // `cornerRadius`
        layer.cornerRadius = CGFloat(image.cornerRadius ?? 0)
        layer.cornerCurve = .continuous

        // `shadow`
        layer.setShadow(image.shadow)

        // `border`
        layer.setBorder(image.border)

        // `padding`
        imageViewInsets = image.padding?.insets ?? .zero

        // `margin` ignored

        // `src`
        imageView.kf.cancelDownloadTask()
        if let uiImage = image.remoteImage?.image {
            imageView.image = uiImage
            return
        }

        imageView.image = nil
        image.remoteImage?.load(in: imageView, completion: completion)
    }
}
