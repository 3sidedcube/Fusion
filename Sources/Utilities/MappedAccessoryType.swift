//
//  MappedAccessoryType.swift
//  Example
//
//  Created by Ben Shutt on 19/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public protocol MappedAccessoryType {

    /// Create a `UIView` to use in place of the default `accessoryView` of a `UITableViewCell`.
    /// Essentially, this `UIView` will handle the `UITableViewCell.AccessoryType` instead of
    /// the `UITableViewCell`.
    ///
    /// - Parameter accessoryType: `UITableViewCell.AccessoryType`
    func createView(for accessoryType: UITableViewCell.AccessoryType) -> UIView
}

// MARK: - UITableViewCell + DisclosureChevron
/*
extension UITableViewCell {

    /// It's not straight forward to customize the `.disclosureIndicator` right arrow
    /// on a `UITableViewCell`. So replace it with a `UIImageView` which we can
    /// configure.
    ///
    /// - Parameter chevron: `DisclosureChevron` styling
    func setDisclosureChevron(_ chevron: DisclosureChevron) {
        // Ensure this is specific to the `.disclosureIndicator`
        // `AccessoryType`
        guard accessoryType == .disclosureIndicator else {
            accessoryView = nil
            return
        }

        // Configure a `UIImageView`
        let imageView = UIImageView(image: chevron.image)
        imageView.contentMode = .center

        // Set custom `accessoryView`
        accessoryView = imageView
    }
}

protocol CustomAccessoryTableViewCell: class {

    var accessoryImageView: UIImageView? { get }

    var mappedAccessoryType: Blood.AccessoryType { get }
}

// MARK: - DefaultTableViewCell + AccessoryType

extension CustomAccessoryTableViewCell {

    /// Result of `mappedAccessoryType != .none`
    var hasAccessoryType: Bool {
        if case Blood.AccessoryType.none = mappedAccessoryType {
            return false
        }
        return true
    }
}

extension CustomAccessoryTableViewCell where Self: UITableViewCell {

    /// Apply `mappedAccessoryType` to `CustomAccessoryTableViewCell`
    func applyAccessoryType() {
        accessoryView = nil
        guard let image = mappedAccessoryType.image else {
            accessoryImageView?.isHidden = true
            return
        }

        accessoryImageView?.isHidden = false
        accessoryImageView?.image = image
    }
}
*/
