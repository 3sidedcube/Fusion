//
//  RemoteImage.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit // Shouldn't usually with a `Model` but required here
import Kingfisher

/// Completion closure when `Image` finishes loading
typealias ImageCompletion = (Result<RetrieveImageResult, KingfisherError>) -> Void

/// Wrap a `UIImage` by loading a `URL`
final class RemoteImage {

    /// Remote image `URL`
    let url: URL

    /// `UIImage` once fetched from the remote URL or cache
    var image: UIImage?

    /// Placeholder `UIImage` to show while a remote image loads
    var placeholder: UIImage?

    /// `KingfisherOptionsInfo`s when loading a remote image
    var remoteOptions: KingfisherOptionsInfo? = [
        .transition(.fade(0.1)),
        .cacheOriginalImage
    ]

    // MARK: - Init

    /// Initialize with `url`
    ///
    /// - Parameter url: `url`
    init(url: URL) {
        self.url = url
    }

    // MARK: - Image

    /// Load this `Image` instance in `imageView`
    ///
    /// - Parameters:
    ///   - imageView: `UIImageView`
    ///   - completion: `ImageCompletion`
    func load(
        in imageView: UIImageView,
        completion: ImageCompletion?
    ) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: remoteOptions,
            completionHandler: { result in // retain self
                if let image = result.remoteImage {
                    self.image = image
                }

                // The `UIImage` is set by Kingfisher on the `UIImageView`
                completion?(result)
            }
        )
    }
}

// MARK: - Result + RetrieveImageResult

extension Result where Success == RetrieveImageResult {

    /// The `image` against the associated value if the result is a `success`
    var remoteImage: UIImage? {
        return success?.image
    }
}
