//
//  ListItemContainerView+ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

extension ListItemContainerView {

    /// Set the given `listItem`
    ///
    /// - Parameters:
    ///   - listItem: `ListItem`
    ///   - completion: `ImageCompletion`
    func setListItem(_ listItem: inout ListItem, completion: ImageCompletion?) {
        // `title`
        listItemView.titleLabelContainerView.isHidden = listItem.title == nil
        listItemView.titleLabelContainerView.setText(listItem.title)

        // `subtitle`
        listItemView.subtitleLabelContainerView.isHidden = listItem.subtitle == nil
        listItemView.subtitleLabelContainerView.setText(listItem.subtitle)

        // `image`
        listItemView.imageContainerView.isHidden = listItem.image == nil
        listItemView.imageContainerView.setImage(listItem.image, completion: completion)

        // `imageSpacing`
        listItemView.hStackView.spacing = CGFloat(listItem.imageSpacing ?? 0)

        // `textSpacing`
        listItemView.vStackView.spacing = CGFloat(listItem.textSpacing ?? 0)

        // `ViewModel`
        setViewModel(listItem)
    }
}
