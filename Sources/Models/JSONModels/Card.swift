//
//  Card.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// An `Image` with a title `Text` and subtitle `Text`
struct Card: Codable {

    /// `Image` of the card
    var image: Image?

    /// `Text` of the title
    var titleText: Text?

    /// `Text` of the subtitle
    var subtitleText: Text?

    /// Corner radius of container view in points
    var cornerRadius: Float?

    /// `Margin` of container view
    var margin: Margin?

    /// `Shadow` of container view
    var shadow: Shadow?
}
