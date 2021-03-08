//
//  ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A standard list item with an `Image`, title `Text`, subtitle `Text`, and a chevron.
public class ListItem: Codable, JSONModel {

    /// `Image` of the leading item
    public var image: Image?

    /// `Text` of the title
    public var title: Text?

    /// `Text` of the subtitle
    public var subtitle: Text?

    /// Spacing between `title` and `subtitle` views
    public var textSpacing: Float?

    /// Spacing between `image` and text views
    public var imageSpacing: Float?

    // MARK: - View

    /// RGBA hex color for the background
    public var backgroundColor: RGBAHex?

    /// `Padding` for insets of own content
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Border` of the container
    public var border: Border?
}
