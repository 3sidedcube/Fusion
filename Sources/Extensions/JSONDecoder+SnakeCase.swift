//
//  JSONDecoder+StatamicAPI.swift
//  Fusion
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension JSONDecoder {

    /// The `.default` `JSONDecoder` with `keyDecodingStrategy` set
    /// to `.convertFromSnakeCase`
    static var snakeCase: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
