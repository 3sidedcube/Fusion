//
//  UITableViewCell+AccessoryType.swift
//  Fusion
//
//  Created by Ben Shutt on 22/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// An entity which will handle the `UITableViewCell.AccessoryType` itself opting out of the system default
protocol MappedAccessoryType {

    /// The "real" `UITableViewCell.AccessoryType` to draw UI for
    var mappedAccessoryType: UITableViewCell.AccessoryType { get }
}

extension MappedAccessoryType {

    /// Set `accessoryView` to `nil` and get `UIImage` for `accessoryType` and
    /// apply to `imageView`.
    ///
    /// - Parameters:
    ///   - imageView: `UIImageView`
    ///   - cell: `UITableViewCell`
    func applyAccessoryType(
        to imageView: UIImageView,
        in cell: UITableViewCell
    ) {
        cell.accessoryView = nil

        let image = Fusion.shared.imageForAccessoryType(mappedAccessoryType)
        imageView.isHidden = image == nil
        imageView.image = image
    }
}
