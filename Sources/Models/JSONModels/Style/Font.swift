//
//  Font.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation

/// Properties which map to a `UIFont`
public struct Font: Codable {

    /// Name of the font, e.g. "Open Sans"
    public var name: String?

    /// Weight of the font, e.g. "Regular"
    public var weight: String?

    /// Size of the font in pt, e.g. 10
    public var size: Float?
}
