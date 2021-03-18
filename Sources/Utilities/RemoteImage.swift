//
//  RemoteImage.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit // Shouldn't usually with a "model" but required here
import Kingfisher

/// `Result` the image fetch task completes with
public typealias ImageDownloadResult = Result<RetrieveImageResult, KingfisherError>

/// Completion closure the image fetch task completes with
public typealias ImageDownloadCompletion = (RemoteImage, ImageDownloadResult) -> Void

/// Wrap a `UIImage` by loading a `URL` using `Kingfisher`
open class RemoteImage {

    /// Remote image `URL`
    public let url: URL

    /// `ImageDownloadResult` the image fetch task completed with
    public private(set) var result: ImageDownloadResult?

    /// If the `result` is `success`, return the `image`
    open var image: UIImage? {
        return result?.success?.image
    }

    // MARK: - Init

    /// Initialize with `url`
    ///
    /// - Parameter url: `url`
    public init(url: URL) {
        self.url = url
    }

    // MARK: - Image

    /// Load this `Image` instance in `imageView`
    ///
    /// - Parameters:
    ///   - imageView: `UIImageView` to load `UIImage` into
    ///   - placeholder: `UIImage` placeholder
    ///   - remoteOptions: `KingfisherOptionsInfo`
    ///   - completion: `ImageDownloadCompletion`
    @discardableResult
    open func load(
        in imageView: UIImageView,
        placeholder: UIImage? = nil,
        remoteOptions: KingfisherOptionsInfo? = [
            .transition(.fade(0.5)),
            .scaleFactor(UIScreen.main.scale),
            .cacheOriginalImage
        ],
        completion: ImageDownloadCompletion?
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
