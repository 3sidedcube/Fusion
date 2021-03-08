//
//  ListItem.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A standard list item with an `Image`, title `Text`, subtitle `Text`, and a chevron.
public struct ListItem: Codable, JSONModel {

    /// `Image` of the leading item
    public var image: Image?

    /// `Text` of the title
    public var title: Text?

    /// `Text` of the subtitle
    public var subtitle: Text?

    /// Corner radius of container view in points
    public var cornerRadius: Float?

    /// `Shadow` of container view
    public var shadow: Shadow?

    /// `Padding` for text insets
    public var padding: Padding?

    /// `Margin` for insets relative to other content
    public var margin: Margin?
}
