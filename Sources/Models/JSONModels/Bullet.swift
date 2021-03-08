//
//  Bullet.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A bullet list item.
/// These items will likely be numbered and grouped into a `BulletGroup`
public struct Bullet: Codable {

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
