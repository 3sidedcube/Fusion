//
//  Bullet.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A bullet list item.
/// These items will likely be numbered and grouped into a `BulletGroup`
///
/// - Note:
/// At time of writing, this is equivalent to the `ListItem` which `image` replaced with `number`
public struct Bullet: Codable, JSONModel, ViewModel {

    /// `Text` of the leading item
    public var bullet: Text?

    /// `Text` of the title
    public var title: Text?

    /// `Text` of the subtitle
    public var subtitle: Text?

    /// Spacing between `title` and `subtitle` views
    public var textSpacing: Float?

    /// Spacing between `image` and text views
    public var imageSpacing: Float?

    /// `ActionJSON` to fire `Action` when clicked
    public var action: ActionJSON?

    // MARK: - ViewModel

    /// RGBA hex color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for insets of own content
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margins?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Border` of the container
    public var border: Border?
}

// MARK: - ListItem

extension Bullet {

    /// Map to `ListItem`
    var listItem: ListItem {
        return ListItem(
            image: nil,
            title: title,
            subtitle: subtitle,
            textSpacing: textSpacing,
            imageSpacing: imageSpacing,
            action: action,
            backgroundColor: backgroundColor,
            padding: padding,
            margin: margin,
            shadow: shadow,
            cornerRadius: cornerRadius,
            border: border
        )
    }
}
