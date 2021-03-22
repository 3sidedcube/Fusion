//
//  ListItemTableViewCell.swift
//  Fusion
//
//  Created by Ben Shutt on 03/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit
import ThunderTable

/// `UITableViewCell` with a `ListItemContainerView`
open class ListItemTableViewCell: ContainerTableViewCell {

    override open func createSubview() -> UIView {
        return ListItemContainerView()
    }

    // swiftlint:disable force_cast
    open var listItemContainerView: ListItemContainerView {
        return subview as! ListItemContainerView
    }
    // swiftlint:enable force_cast

    // MARK: - Lifecycle

    /// - Warning:
    /// Because the `BulletRow` reuses the `ListItemTableViewCell` and we can't create
    /// a custom cell subclass, we must 
    override open func prepareForReuse() {
        super.prepareForReuse()
        BulletRow.prepareForReuse(cell: self)
    }

    // MARK: - Shorthand

    open var listItemView: ListItemView {
        return listItemContainerView.listItemView
    }

    open var hStackView: UIStackView {
        return listItemView.hStackView
    }

    open var vStackView: UIStackView {
        return listItemView.vStackView
    }

    open var imageContainerView: ImageContainerView {
        return listItemView.imageContainerView
    }

    open var cellImageView: AdjustableImageView {
        return imageContainerView.imageView
    }

    open var titleContainerView: LabelContainerView {
        return listItemView.titleLabelContainerView
    }

    open var titleLabel: InsetLabel {
        return titleContainerView.label
    }

    open var subtitleContainerView: LabelContainerView {
        return listItemView.subtitleLabelContainerView
    }

    open var subtitleLabel: InsetLabel {
        return subtitleContainerView.label
    }

    open var numberContainerView: NumberContainerView? {
        return listItemView.firstSubviewOfType()
    }

    open var numberLabel: InsetLabel? {
        return numberContainerView?.label
    }

    open var accessoryContainerView: ImageContainerView {
        return listItemView.accessoryContainerView
    }

    open var accessoryImageView: AdjustableImageView {
        return accessoryContainerView.imageView
    }
}
