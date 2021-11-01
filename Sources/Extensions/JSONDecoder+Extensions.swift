//
//  JSONDecoder+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension JSONDecoder {

    /// A `JSONDecoder` with:
    /// - `dateDecodingStrategy` set to `.iso8601`
    /// - `keyDecodingStrategy` set to `.convertFromSnakeCase`
    static var fusion: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
