//
//  CMSEnum.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An `enum` returned from the CMS that is wrapped in a `CMSEnum` structure
public struct CMSEnum<T>: Codable where T: RawRepresentable, T: Codable {

    /// Key for value
    public var key: String?

    /// Value of type `T`
    public var value: T

    /// Human readable name for `key`
    public var label: String?
}
