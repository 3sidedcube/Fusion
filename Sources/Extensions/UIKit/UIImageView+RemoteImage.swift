//
//  UIImageView+RemoteImage.swift
//  Fusion
//
//  Created by Ben Shutt on 17/03/2021.
//

import Foundation
import UIKit
import Kingfisher

public extension UIImageView {

    /// Load the given `remoteImage`
    ///
    /// - Parameters:
    ///   - remoteImage: `RemoteImage`
    ///   - completion: `ImageDownloadCompletion`
    ///
    /// - Returns: `DownloadTask` if image executes a download
    @discardableResult
    func loadRemoteImage(
        _ remoteImage: RemoteImage?,
        completion: ImageDownloadCompletion?
    ) -> DownloadTask? {
        kf.cancelDownloadTask()
        if let uiImage = remoteImage?.image {
            image = uiImage
            return nil
        }

        image = nil
        return remoteImage?.load(in: self, completion: completion)
    }
}
