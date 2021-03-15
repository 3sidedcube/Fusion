//
//  RemoteImage.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit // Shouldn't usually with a "model" but required here
import Kingfisher

/// `Result` the image fetch task completes with
typealias ImageResult = Result<RetrieveImageResult, KingfisherError>

/// Completion closure with a `RemoteImage`
typealias ImageCompletion = (RemoteImage, ImageResult) -> Void

/// Wrap a `UIImage` by loading a `URL` using `Kingfisher`
final class RemoteImage {

    /// Remote image `URL`
    let url: URL

    /// `UIImage` once fetched from the remote URL or cache
    private(set) var result: ImageResult?

    /// If the `result` is `success`, return the `image`
    var image: UIImage? {
        return result?.success?.image
    }

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
    ///   - imageView: `UIImageView` to load `UIImage` into
    ///   - placeholder: `UIImage` placeholder
    ///   - remoteOptions: `KingfisherOptionsInfo`
    ///   - completion: `ImageCompletion`
    @discardableResult
    func load(
        in imageView: UIImageView,
        placeholder: UIImage? = nil,
        remoteOptions: KingfisherOptionsInfo? = [
            .transition(.fade(0.5)),
            .scaleFactor(UIScreen.main.scale),
            .cacheOriginalImage
        ],
        completion: ImageCompletion?
    ) -> DownloadTask? {
        imageView.kf.indicatorType = .activity
        return imageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: remoteOptions,
            completionHandler: { result in // retain self
                // The `UIImage` is set on the `UIImageView` by Kingfisher
                self.result = result
                completion?(self, result)
            }
        )
    }
}
