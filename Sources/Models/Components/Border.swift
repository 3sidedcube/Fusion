//
//  Border.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// Border styling
public struct Border: Codable {

    /// `RGBAHex` color of the border
    public var color: RGBAHex?

    /// Stroke (or line) width of the border
    public var strokeWidth: Float?
}
