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
class ImageRow: FusionRow<ImageTableViewCell> {

    /// `Image` to drive UI
    private(set) var image: Image

    /// Return `image` of `remoteImage`
    private var uiImage: UIImage? {
        return image.remoteImage?.image
    }

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - image: `Image`
    init(image: Image) {
        self.image = image
    }

    // MARK: - Row

    /// Given a fixed `targetWidth`, get the target height by scaling proportionally
    /// to the aspect ratio of the `rowImage`
    ///
    /// - Parameter targetWidth: `CGFloat` width to force
    func imageHeight(for targetWidth: CGFloat) -> CGFloat {
        if let image = uiImage {
            return min(image.imageHeight(for: targetWidth), image.size.height)
        }

        return 0
    }

    /// Return `imageHeight`
    var estimatedHeight: CGFloat? {
        return imageHeight(for: UIScreen.main.bounds.width)
    }

    // MARK: - Configure

    override func configureCell(
        _ cell: ImageTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Set view-model
        let imageBefore = uiImage
        cell.imageContainerView.setImage(
            image
        ) { [weak self, weak tableViewController] remoteImage, _ in
            guard let self = self, remoteImage.image != imageBefore else { return }
            (tableViewController as? RowUpdateListener)?.rowRequestedUpdate(self)
        }
    }
}
