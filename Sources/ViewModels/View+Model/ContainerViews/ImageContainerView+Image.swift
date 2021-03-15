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
    @discardableResult
    func setImage(_ image: Image?, completion: ImageCompletion?) -> DownloadTask? {
        // `fixedSize`
        subview.fixedSize = image?.fixedSize

        // `ViewModel`
        setViewModel(image)

        // `src`
        imageView.kf.cancelDownloadTask()
        if let uiImage = image?.remoteImage?.image {
            imageView.image = uiImage
            return nil
        }

        imageView.image = nil
        return image?.remoteImage?.load(in: imageView, completion: completion)
    }
}
