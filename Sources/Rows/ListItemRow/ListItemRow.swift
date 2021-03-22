//
//  ListItemRow.swift
//  Fusion
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A `Row` which draws a `ListItem`
open class ListItemRow: FusionRow<ListItemTableViewCell>, MappedAccessoryType {

    /// `ListItem` to drive UI
    public private(set) var listItem: ListItem

    // MARK: - Init

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - listItem: `ListItem`
    public init(listItem: ListItem) {
        self.listItem = listItem
    }

    // MARK: - Row

    /// `SelectionHandler`
    override open var selectionHandler: SelectionHandler? {
        guard let action = try? listItem.action?.toAction() else { return nil }
        return { [weak self] _, _, _, _ in
            self?.actionHandler?.handleAction(action)
        }
    }

    /// Always return `none` and handle the `accessoryType` manually with
    /// `mappedAccessoryType`.
    ///
    /// This is because the cell may be inset for design reasons by `Margins`.
    /// The `accessoryView` is not contained in the `ContainerView` and thus
    /// will not be inset when required.
    override open var accessoryType: UITableViewCell.AccessoryType? {
        return UITableViewCell.AccessoryType.none
    }

    /// Return the "real" `UITableViewCell.AccessoryType` here to handle custom `accessoryView`
    open var mappedAccessoryType: UITableViewCell.AccessoryType {
        return super.accessoryType ?? UITableViewCell.AccessoryType.none
    }

    // MARK: - Configure

    override open func configureCell(
        _ cell: ListItemTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // Handle highlighting
        let containerView = cell.listItemContainerView
        containerView.subview.isHighlightable = selectionHandler != nil

        // Set view-model
        let imageBefore = listItem.image?.remoteImage?.image
        containerView.setListItem(
            listItem
        ) { [weak self, weak tableViewController] remoteImage, _ in
            guard let self = self, remoteImage.image != imageBefore else { return }
            (tableViewController as? RowUpdateListener)?.rowRequestedUpdate(self)
        }

        // Update the `accessoryView`
        applyAccessoryType(to: cell.accessoryImageView, in: cell)
    }
}
