//
//  JSONEncoder+StatamicAPI.swift
//  Fusion
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

extension JSONEncoder {

    /// The `.default` `JSONEncoder` with `keyEncodingStrategy` set
    /// to `.convertToSnakeCase`
    static var snakeCase: JSONEncoder {
        let encoder = JSONEncoder.default
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}
