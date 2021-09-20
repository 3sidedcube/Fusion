//
//  BorderModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Model of border properties
public struct BorderModel: Codable {

    /// `RGBAHex` color of the border
    public var color: RGBAHex?

    /// Stroke (or line) width of the border
    public var strokeWidth: Points?
}
