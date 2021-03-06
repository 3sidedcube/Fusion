//
//  TextAlignment.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A `TextAlignment` wraps an `NSTextAlignment`
public enum TextAlignment: String, Codable {

    /// Text is visually left-aligned.
    case left

    /// Text is visually right-aligned.
    case right

    /// Text is visually center-aligned.
    case center

    /// Text is justified.
    case justified
}
