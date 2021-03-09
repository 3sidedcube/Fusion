//
//  Row+RemoteImage.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit
import ThunderTable

extension Row where Self: AnyObject {

    /// Load `image` for `imageView` requesting a `UITableView` update if
    /// `tableViewController` is a `RowUpdateListener`.
    ///
    /// - Note:
    /// A `UITableViewCell` may be reused, to protect against this, cancel the download
    /// tasks on `imageView` before fetching a new image. This should be done before calling this method.
    ///
    /// - Parameters:
    ///   - image: `RemoteImage`
    ///   - imageView: `UIImageView`
    ///   - tableViewController: `TableViewController`
    func load(
        image: RemoteImage,
        for imageView: UIImageView,
        in tableViewController: TableViewController?
    ) {
        // Only fire an update if the image has been loaded
        let initialImage = image.image

        // Load `image` into `imageView`
        image.load(in: imageView) { [weak self, weak tableViewController] result in
            guard
                let self = self,
                initialImage == nil,
                result.remoteImage != nil,
                let updateListener = tableViewController as? RowUpdateListener
            else {
                return
            }

            updateListener.rowRequestedUpdate(self)
        }
    }
}
