//
//  ImageSource.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// Source of a remote image
public struct ImageSource: Codable {

    /// Remote URL source
    public var url: String?

    /// `Size`
    public var size: Size?
}
