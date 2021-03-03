//
//  JSONDecoder+StatamicAPI.swift
//  Fusion
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

extension JSONDecoder {

    /// The `.default` `JSONDecoder` with `keyEncodingStrategy` set
    /// to `.convertToSnakeCase`
    static var snakeCase: JSONDecoder {
        let decoder = JSONDecoder.default
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
