//
//  Fusion.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest
import Alamofire

/// Overridable configuration properties.
///
/// Referencing apps can set the shared `static` singleton instance to define
/// their own `Fusion` instance
open class Fusion {

    /// `Fusion` shared `static` singleton instance
    public static var shared = Fusion()

    /// `JSONDecoder` to use for JSON decoding
    open var jsonDecoder: JSONDecoder {
        return JSONDecoder.snakeCase
    }

    /// `JSONEncoder` to use for JSON encoding
    open var jsonEncoder: JSONEncoder {
        return JSONEncoder.snakeCase
    }

    /// `JSONModel`s to dynamically decode from the JSON
    open var jsonModels: [JSONModel.Type] {
        return []
    }
}
