//
//  TextProperties.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation

/// Properties which define how to draw text
public protocol TextProperties {

    /// `String` text
    var content: String? { get }

    /// `RGBAHex` color of the text background
    var backgroundColor: RGBAHex? { get }

    /// `RGBAHex` color of the text
    var textColor: RGBAHex? { get }

    /// `Font` of the text
    var font: Font? { get }

    /// `TextAlignment` to position text
    var textAlignment: TextAlignment? { get }

    /// Number of lines of text to draw
    var numberOfLines: Int? { get }

    /// Height of each line
    var lineHeight: Float? { get }

    /// Letter spacing between characters
    var letterSpacing: Float? { get }
}
