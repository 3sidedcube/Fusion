//
//  ImageSource.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// Source of a remote image
public struct ImageSource: Codable {

    /// Image id as `String`
    public var id: String?

    /// Permalink `String`
    public var permalink: String?

    /// API `URL` `String`
    public var apiUrl: String?

    /// Remote `URL` `String` source
    public var url: String?

    /// `Size` of the image
    public var size: Size?
}
