//
//  ListItemTableViewCell+ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation

extension ListItemTableViewCell {

    /// Set the given `listItem`
    ///
    /// - Parameters:
    ///   - listItem: `ListItem`
    ///   - completion: `ImageCompletion`
    func setListItem(_ listItem: inout ListItem, completion: ImageCompletion?) {
        listItemContainerView.setListItem(&listItem, completion: completion)
    }
}
