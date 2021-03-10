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
    /// - Parameters:
    ///   - listItem: `ListItem`
    ///   - completion: `ImageCompletion`
    func setListItem(_ listItem: inout ListItem, completion: ImageCompletion?) {
        defaultView.setListItem(&listItem, completion: completion)
    }
}
