//
//  ImageRow.swift
//  CBIT
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable
import Kingfisher

/// A `Row` which draws an `Image`
///
/// - Note:
/// The height of the `ImageRow` should be determined by the `size` of the `UIImage`
open class ImageRow: FusionRow<ImageTableViewCell> {

    /// `Image` to drive UI
    public private(set) var image: Image

    /// Return `image` of `remoteImage`
    public var uiImage: UIImage? {
        return image.remoteImage?.image
    }

    /// `DownloadTask` for fetching the image
    public private(set) var downloadTask: DownloadTask?

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - image: `Image`
    public init(image: Image) {
        self.image = image
    }

    // MARK: - Row

    /// Given a fixed `targetWidth`, get the target height by scaling proportionally
    /// to the aspect ratio of the `rowImage`
    ///
    /// - Parameter targetWidth: `CGFloat` width to force
    private func imageHeight(for targetWidth: CGFloat) -> CGFloat {
        if let image = uiImage {
            return min(image.imageHeight(for: targetWidth), image.size.height)
        }

        return 0
    }

    /// Return `imageHeight`
    open var estimatedHeight: CGFloat? {
        return imageHeight(for: UIScreen.main.bounds.width)
    }

    // MARK: - Configure

    override open func configureCell(
        _ cell: ImageTableViewCell,
        at indexPath: IndexPath,
        in controller: TableViewController
    ) {
        // Set view-model
        let imageBefore = uiImage
        downloadTask = cell.imageContainerView.setImage(
            image
        ) { [weak self, weak controller] _, _ in
            guard let self = self, self.uiImage != imageBefore else { return }
            (controller as? RowUpdateListener)?.rowRequestedUpdate(self)
        }

        redrawUI(cell)
    }

    /// Update `Padding` and `Margins` based on image download state
    ///
    /// - Parameter cell: `ImageTableViewCell`
    private func redrawUI(_ cell: ImageTableViewCell) {
        // `Padding` and `Margins` to set
        let padding: Padding
        let margins: Margins

        if let task = downloadTask, task.isRunning {
            // Task in progress - ad padding to show activity indicator
            padding = .init(top: 20, left: 0, right: 0, bottom: 20)
            margins = .zero
        } else if uiImage != nil {
            // Task finished with an image - show UI
            padding = image.padding ?? .zero
            margins = image.margin ?? .zero
        } else {
            // Task finished without an image - hide UI
            padding = .zero
            margins = .zero
        }

        // Update UI
        cell.imageContainerView.padding = padding
        cell.imageContainerView.margins = margins
    }
}

// MARK: - DownloadTask

private extension DownloadTask {

    /// Check if the `URLSessionDataTask` has a `state` equal to `.running`
    var isRunning: Bool {
        return sessionTask.task.state == .running
    }
}
