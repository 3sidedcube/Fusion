//
//  DefaultTableViewCell+ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation

extension DefaultTableViewCell {

    /// Set the given `listItem`
    ///
    /// - Parameter text: `ListItem`
    func setListItem(_ listItem: ListItem) {
        // `title`
        titleLabel.isHidden = listItem.title == nil
        if let title = listItem.title {
            titleLabel.setText(title)
        }

        // `subtitle`
        subtitleLabel.isHidden = listItem.subtitle == nil
        if let subtitle = listItem.subtitle {
            subtitleLabel.setText(subtitle)
        }

        // `image`

    }
}
