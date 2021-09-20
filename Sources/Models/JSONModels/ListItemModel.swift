//
//  ListItemModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A standard list item with an `Image`, title `Text`, subtitle `Text`, and a chevron.
public struct ListItemModel: Codable, JSONModel, ViewModel, Actionable {

    /// `Image` of the leading item
    public var image: ImageModel?

    /// `Text` of the title
    public var title: TextModel?

    /// `Text` of the subtitle
    public var subtitle: TextModel?

    /// Spacing between `title` and `subtitle` views
    public var textSpacing: Points?

    /// Spacing between `image` and text views
    public var imageSpacing: Points?

    /// `ActionJSON` to fire `Action` when clicked
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
