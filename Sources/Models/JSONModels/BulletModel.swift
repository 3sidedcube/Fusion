//
//  BulletModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
//
//  Bullet.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A bullet list item.
/// These items will likely be numbered and grouped into a `BulletGroupModel`
///
/// - Note:
/// This is equivalent to the `ListItemModel` with `image` replaced with `bullet`
public struct BulletModel: Codable, JSONModel, ViewModel, Actionable {

    /// `TextModel` of the bullet
    public var bullet: TextModel?

    /// `TextModel` of the title
    public var title: TextModel?

    /// `TextModel` of the subtitle
    public var subtitle: TextModel?

    /// `Points` spacing between `title` and `subtitle` views
    public var textSpacing: Points?

    /// `Points` spacing between `bullet` and text views
    public var imageSpacing: Points?

    /// `ActionJSON` on click
    public var action: ActionJSON?

    // MARK: - ViewModel

    /// `RGBAHex` background color
    public var backgroundColor: RGBAHex?

    /// `InsetsModel` padding insets
    public var padding: InsetsModel?

    /// `InsetsModel` margin insets
    public var margin: InsetsModel?

    /// `BorderModel`
    public var border: BorderModel?

    /// `ShadowModel`
    public var shadow: ShadowModel?

    /// `Points` of corner radius
    public var cornerRadius: Points?
}

// MARK: - ListItem

extension BulletModel {

    /// Map to `ListItemModel`
    var listItem: ListItemModel {
        return ListItemModel(
            image: nil,
            title: title,
            subtitle: subtitle,
            textSpacing: textSpacing,
            imageSpacing: imageSpacing,
            action: action,
            backgroundColor: backgroundColor,
            padding: padding,
            margin: margin,
            border: border,
            shadow: shadow,
            cornerRadius: cornerRadius
        )
    }
}
