//
//  CMSEnum.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation

/// An `enum` returned from the CMS that is wrapped in a `CMSEnum` structure
public struct CMSEnum<T>: Codable where T: RawRepresentable, T: Codable {

    /// Key for value
    public var key: String?

    /// Value of type `T`
    public var value: T
}
