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

/// `UITableViewCell` subclass
private typealias CellClass = ImageTableViewCell

/// A `Row` which draws an `Image`
/// The height of the `ImageRow` should be determined by the `size` of the `UIImage`
class ImageRow: Row, CellHeightConfigurable {

    /// `Image` to drive UI
    let image: Image

    /// `RemoteImage` from the `URL` of `image`
    private(set) lazy var remoteImage: RemoteImage? = {
        guard let url = image.url else { return nil }
        return RemoteImage(url: url)
    }()

    /// Return `image` of `remoteImage`
    private var uiImage: UIImage? {
        return remoteImage?.image
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

    /// `UITableViewCell` subclass to draw
    var cellClass: UITableViewCell.Type? {
        return CellClass.self
    }

    /// Handle selection style on the cell
    var selectionStyle: UITableViewCell.SelectionStyle? {
        return nil
    }

    /// Given a fixed `targetWidth`, get the target height by scaling proportionally
    /// to the aspect ratio of the `rowImage`
    ///
    /// - Parameter targetWidth: `CGFloat` width to force
    func imageHeight(for targetWidth: CGFloat) -> CGFloat {
        if let image = self.uiImage {
            return min(image.imageHeight(for: targetWidth), image.size.height)
        }

        if let size = image.src?.size {
            return size.cgSize.height(for: targetWidth)
        }

        return 0
    }

    /// Return `imageHeight`
    var estimatedHeight: CGFloat? {
        return imageHeight(for: UIScreen.main.bounds.width)
    }

    // MARK: - Configure

    func configure(
        cell: UITableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        guard let cell = cell as? CellClass else { return }

        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.setImage(image)

        // cellImageView
        cell.cellImageView.contentMode = .scaleAspectFill
        cell.cellImageView.image = nil
        cell.cellImageView.kf.cancelDownloadTask()
        if let image = remoteImage {
            load(image: image, for: cell.cellImageView, in: tableViewController)
        }
    }

    // MARK: - CellHeightConfigurable

    func heightForRowInTableViewController(
        _ tableViewController: TableViewController,
        forRowAt indexPath: IndexPath
    ) -> CGFloat {
        // Vertical insets
        let verticalMargin = max(0, image.margin?.insets.verticalSum ?? 0)
        let verticalPadding = max(0, image.padding?.insets.verticalSum ?? 0)

        // Horizontal insets
        let horizontalMargin = max(0, image.margin?.insets.horizontalSum ?? 0)
        let horizontalPadding = max(0, image.padding?.insets.horizontalSum ?? 0)

        // Get the targetWidth of the image
        let tableViewWidth = tableViewController.tableView.bounds.width
        let insetWidth = tableViewWidth - horizontalMargin - horizontalPadding
        let targetWidth = max(0, insetWidth)

        // Get the targetHeight of the image
        let targetHeight = self.imageHeight(for: targetWidth)
        return targetHeight + verticalMargin + verticalPadding
    }
}
