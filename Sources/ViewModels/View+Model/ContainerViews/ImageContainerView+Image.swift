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
    ///   - completion: `ImageDownloadCompletion`
    @discardableResult
    func setImage(
        _ image: Image?,
        completion: ImageDownloadCompletion?
    ) -> DownloadTask? {
        // `fixedSize`
        subview.fixedSize = image?.fixedSize

        // `ViewModel`
        setViewModel(image)

        // `src`
        return imageView.loadRemoteImage(image?.remoteImage, completion: completion)
    }
}
