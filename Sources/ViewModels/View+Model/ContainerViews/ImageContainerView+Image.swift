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
        setViewModel(image)

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
