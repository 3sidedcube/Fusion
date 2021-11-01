//
//  HTTPHeader+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 27/10/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - HTTPHeader + Extensions

extension HTTPHeader {

    /// - Name: `"Accept"`
    /// - Value: `"application/json"`
    static var acceptJSON: HTTPHeader {
        return HTTPHeader(name: "Accept", value: "application/json")
    }
}

// MARK: - HTTPHeaders + Extensions

extension HTTPHeaders {

    /// Return `self` with `add(_:)` called with `header`
    ///
    /// - Parameter header: `HTTPHeader` to add
    /// - Returns: `HTTPHeaders` updated value
    func adding(_ header: HTTPHeader) -> HTTPHeaders {
        var newValue = self
        newValue.add(header)
        return newValue
    }


    /// Default Fusion headers
    static var fusionJSON: HTTPHeaders {
        return .default.adding(.acceptJSON)
    }
}
