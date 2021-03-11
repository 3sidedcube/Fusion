//
//  DefaultContainerView+ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

extension DefaultContainerView {

    /// Set the given `listItem`
    ///
    /// - Parameters:
    ///   - listItem: `ListItem`
    ///   - completion: `ImageCompletion`
    func setListItem(_ listItem: inout ListItem, completion: ImageCompletion?) {
        // `title`
        defaultView.titleLabelContainerView.isHidden = listItem.title == nil
        defaultView.titleLabelContainerView.setText(listItem.title)

        // `subtitle`
        defaultView.subtitleLabelContainerView.isHidden = listItem.subtitle == nil
        defaultView.subtitleLabelContainerView.setText(listItem.subtitle)

        // `image`
        defaultView.imageContainerView.isHidden = listItem.image == nil
        if listItem.image != nil {
            defaultView.imageContainerView.setImage(&listItem.image!, completion: completion)
        }

        // `imageSpacing`
        defaultView.hStackView.spacing = CGFloat(listItem.imageSpacing ?? 0)

        // `textSpacing`
        defaultView.vStackView.spacing = CGFloat(listItem.textSpacing ?? 0)

        // `view-model`
        setViewModel(listItem)
    }
}
