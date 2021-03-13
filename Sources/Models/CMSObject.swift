//
//  CMSObject.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An object returned from the CMS that is wrapped in a `CMSObject` structure
public struct CMSObject<T>: Codable where T: Codable {

    /// An object `T` wrapped in `"data"`
    public var data: T
}
