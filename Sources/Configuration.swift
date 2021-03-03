//
//  Configuration.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

/// Configuration properties.
///
/// Referencing apps can set the shared `static` singleton instance to define
/// their own `Configuration` instance
class Configuration {

    /// `Configuration` shared `static` singleton instance
    static var shared = Configuration()

    /// `JSONDecoder` to use for JSON decoding
    var jsonDecoder: JSONDecoder {
        return JSONDecoder.default
    }

    /// `JSONEncoder` to use for JSON encoding
    var jsonEncoder: JSONEncoder {
        return JSONEncoder.default
    }
}
