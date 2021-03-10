//
//  DefaultView+ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

extension DefaultView {

    /// Set the given `listItem`
    ///
    /// - Parameters:
    ///   - listItem: `ListItem`
    ///   - completion: `ImageCompletion`
    func setListItem(_ listItem: inout ListItem, completion: ImageCompletion?) {
        // `title`
        titleLabelContainerView.isHidden = listItem.title == nil
        if let title = listItem.title {
            titleLabelContainerView.setText(title)
        }

        // `subtitle`
        subtitleLabelContainerView.isHidden = listItem.subtitle == nil
        if let subtitle = listItem.subtitle {
            subtitleLabelContainerView.setText(subtitle)
        }

        // `image`
        imageContainerView.isHidden = listItem.subtitle == nil
        if listItem.image != nil {
            imageContainerView.setImage(&listItem.image!, completion: completion)
        }

        // `imageSpacing`
        horizontalStackView.spacing = CGFloat(listItem.imageSpacing ?? 0)

        // `textSpacing`
        verticalStackView.spacing = CGFloat(listItem.textSpacing ?? 0)

        // `backgroundColor`
        containerView.backgroundColor = listItem.backgroundColor?.hexColor ?? .clear

        // `padding`
        padding = listItem.padding?.insets ?? .zero

        // `margin`
        margin = listItem.margin?.insets ?? .zero

        // `shadow`
        containerView.layer.setShadow(listItem.shadow)

        // `cornerRadius`
        containerView.layer.setCornerRadius(listItem.cornerRadius)

        // `border`
        containerView.layer.setBorder(listItem.border)
    }
}
